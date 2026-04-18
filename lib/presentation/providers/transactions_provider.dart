import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/classification_rule_entity.dart';
import '../../domain/usecases/csv_parser_usecase.dart';
import '../../domain/usecases/analytics_engine_usecase.dart';
import '../../core/logger/local_logger.dart';

part 'transactions_provider.g.dart';

@riverpod
class TransactionsNotifier extends _$TransactionsNotifier {
  @override
  FutureOr<List<TransactionEntity>> build() async {
    // Estado inicial intocado
    return [];
  }

  Future<void> importStringLedger(String rawCsv, List<ClassificationRuleEntity> rules) async {
    state = const AsyncValue.loading();
    
    final parser = CsvParserUseCase();
    final parseResult = await parser.parseRawString(rawCsv);

    parseResult.match(
      (failure) async {
        // RedTeam Policy: Rastro restrito aos Logs criptografados. Nunca pichar a UI.
        await LocalLogger.log('SEG-CSV_REJEITADO', 'Tentativa de importação contendo sujeira ou Regex overflow: ${failure.message}');
        
        // Retornamos ao Estado Seguro para a UI
        state = AsyncValue.error("O arquivo contém caracteres não homologados. Foi bloqueado no painel local.", StackTrace.current);
      },
      (transactions) async {
        // Parse Limpo O(1) -> Classificacao O(N)
        final engine = AnalyticsEngineUseCase();
        final classifiedResult = await engine.classifyTransactions(transactions, rules);

        classifiedResult.match(
          (failure) async {
            await LocalLogger.log('SEG-ANALYTICS_REJEITADO', 'Engine O(N) falhou no loop: ${failure.message}');
            state = AsyncValue.error("Falha matemática na indexação de categorias.", StackTrace.current);
          },
          (classified) {
            // Emissão Reativa 60FPS
            state = AsyncValue.data(classified);
          }
        );
      }
    );
  }
}
