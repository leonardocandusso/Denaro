import 'package:freezed_annotation/freezed_annotation.dart';
import 'value_objects.dart';

part 'transaction_entity.freezed.dart';

/// Justificativa Eng: Classe imutavel gerada pelo Freezed. 
/// Os campos sensiveis (como amount) sao selados pelos ValueObjects,
/// proibindo que a UI injete '20.50' (String livre) nas entranhas do app.
@freezed
abstract class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    required String id,
    required TransactionAmount amount,
    required String rawDescription,
    required DateTime transactionDate,
    String? resolvedCategory, // Anexado pelo Analytics Engine depois
  }) = _TransactionEntity;
}
