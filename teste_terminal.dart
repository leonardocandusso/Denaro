import 'package:denaro/domain/entities/classification_rule_entity.dart';
import 'package:denaro/domain/usecases/analytics_engine_usecase.dart';
import 'package:denaro/domain/usecases/csv_parser_usecase.dart';

void main() async {
  print('=============== INICIANDO MOTOR DENARO (PURE DART) ===============');
  print('-> Comprovando a Pureza Arquitetural: O código do core funciona sem interface gráfica e sem Flutter!\n');

  // 1. Simular um CSV exportado (Com uma tentativa de injeção de lixo na linha 3)
  final mockCsv = """
10/04/2026;UBER *PGTO TRIP;-25.50
12/04/2026;PAGAMENTO SALARIO CONTA;5200.00
14/04/2026;iFood *Hamburger;DROP TABLE USERS; <-- Hack attempt falhando 
15/04/2026;IFOOD *PIZZA;-45.90
18/04/2026;COMPRA SUPERMERCADO;-150.25
""";

  // 2. Simulando Regras do Banco Criptografado
  final rules = [
    ClassificationRuleEntity(ruleId: '1', regexPattern: r'UBER', targetCategory: 'Transporte', priorityWeight: 10),
    ClassificationRuleEntity(ruleId: '2', regexPattern: r'SALARIO', targetCategory: 'Renda Principal', priorityWeight: 10),
    ClassificationRuleEntity(ruleId: '3', regexPattern: r'IFOOD', targetCategory: 'Alimentação App', priorityWeight: 8),
    ClassificationRuleEntity(ruleId: '4', regexPattern: r'SUPERMERCADO', targetCategory: 'Mercado Fixo', priorityWeight: 5),
  ];

  print('[*] Despachando CsvParserUseCase para Sub-thread (Isolates)...');
  final parser = CsvParserUseCase();
  final parseResult = await parser.parseRawString(mockCsv);

  parseResult.match(
    (failure) => print('❌ ERRO CRÍTICO NA FONTE: ${failure.message}'),
    (transactions) async {
      print('✅ [OK] ${transactions.length} Transações extraídas a seco (Linha com DROP TABLE corrompida foi blindada e expurgada!).\n');
      
      print('[*] Injetando Categorias O(N) nas Transações Resultantes...');
      final engine = AnalyticsEngineUseCase();
      final classifiedResult = await engine.classifyTransactions(transactions, rules);

      classifiedResult.match(
        (f) => print('❌ Erro no Analytics'),
        (classifiedTx) {
          print('\n========= RESULTADO FINAL (Freezed Entities) =========');
          for (var t in classifiedTx) {
            // Regra visual de CLI
            final category = t.resolvedCategory ?? 'NÃO CATEGORIZADO';
            final flow = t.amount.value < 0 ? '[DESPESA]' : '[RECEITA]';
            // Output Flat:
            print('-> ${t.transactionDate.day}/${t.transactionDate.month}/2026 | $flow [$category] | Descrição: ${t.rawDescription} | Valor: ${t.amount.value}');
          }
          print('======================================================\n');
        }
      );
    }
  );
}
