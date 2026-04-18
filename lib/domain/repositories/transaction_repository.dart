import 'package:fpdart/fpdart.dart';
import '../entities/transaction_entity.dart';
import '../entities/value_objects.dart';

/// Justificativa de Engenharia (Inversão de Dependência): 
/// O Domínio define esta interface "Ports" sem saber que SQLite existe. 
/// A Camada de Data (Fase futura) implementará os métodos usando o DatabaseProvider da Fase 1.
abstract class TransactionRepository {
  Future<Either<ValueFailure, Unit>> saveTransaction(TransactionEntity transaction);
  Future<Either<ValueFailure, List<TransactionEntity>>> getLatestTransactions(int limit);
}
