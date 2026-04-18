import 'dart:isolate';
import 'package:fpdart/fpdart.dart';
import '../entities/transaction_entity.dart';
import '../entities/value_objects.dart';

class CsvParserUseCase {
  /// Executa o parser isolacionista em sub-thread, blindando a UI e o SO (sem dart:io).
  Future<Either<ValueFailure, List<TransactionEntity>>> parseRawString(String rawCsv) async {
    return await Isolate.run(() => _internalIsolatedParse(rawCsv));
  }

  /// Thread Cega Secundaria:
  static Either<ValueFailure, List<TransactionEntity>> _internalIsolatedParse(String rawCsv) {
    if (rawCsv.trim().isEmpty) {
      return const Left(ValueFailure('Payload de texto vazio.'));
    }

    final lines = rawCsv.split('\n');
    final List<TransactionEntity> parsedResults = [];
    int validIncrementalId = 1;
    
    for (var line in lines) {
      final stripped = line.trim();
      if (stripped.isEmpty) continue;

      // Mitigação ReDoS e de Memory Bombing por string absurda em CSV.
      if (stripped.length > 500) {
        return const Left(ValueFailure('Segurança Funcional: Linhas suspeitas excessivamente longas (Cargas maliciosas barradas).'));
      }

      // Parse simples de ponto-e-vírgula (`Data;Descrição;Valor`). Regex profundos virão futuramente sob os Adapter dos bancos específicos.
      final columns = stripped.split(';');
      if (columns.length < 3) continue;

      // Sanitiza Data BR
      final dateRaw = columns[0].split('/');
      DateTime? dt;
      if (dateRaw.length == 3) {
        dt = DateTime.tryParse('${dateRaw[2]}-${dateRaw[1]}-${dateRaw[0]}');
      }
      
      // Omitir falhas isoladas preserva os dados limpos parciais, mas num AppSec rigoroso
      // poderiamos retornar Left falhando O LOTE inteiro se dt == null.
      if (dt == null) continue;

      final description = columns[1].trim();
      final amountEither = TransactionAmount.createFromString(columns[2]);

      // FP: Se Value Object é válido (Right), anexa a Entity final.
      amountEither.match(
        (failure) { /* Ignora linha corrompida por letras e ruidos */ }, 
        (amountObj) {
          parsedResults.add(TransactionEntity(
            id: "local_id_${validIncrementalId++}",
            amount: amountObj,
            rawDescription: description,
            transactionDate: dt!,
          ));
        }
      );
    }

    if (parsedResults.isEmpty) {
      return const Left(ValueFailure('Nenhum dado formatado extraido. Lote corrompido ou colunas erradas.'));
    }
    
    return Right(parsedResults);
  }
}
