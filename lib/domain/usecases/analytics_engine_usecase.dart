import 'dart:isolate';
import 'package:fpdart/fpdart.dart';
import '../entities/transaction_entity.dart';
import '../entities/classification_rule_entity.dart';
import '../entities/value_objects.dart';

class AnalyticsEngineUseCase {
  /// Atribui categorias às transações varrendo um Dicionário de Regex (Cache in O(1)).
  /// O processo é escalado em Isolate para suportar processamento paralelo em UI.
  Future<Either<ValueFailure, List<TransactionEntity>>> classifyTransactions(
    List<TransactionEntity> transactions, 
    List<ClassificationRuleEntity> rules
  ) async {
    if (transactions.isEmpty) return Right([]);
    if (rules.isEmpty) return Right(transactions); // Nada a classificar

    // Injeção de thread distribuída.
    return await Isolate.run(() => _internalClassification(transactions, rules));
  }

  static Either<ValueFailure, List<TransactionEntity>> _internalClassification(
    List<TransactionEntity> transactions, 
    List<ClassificationRuleEntity> rules
  ) {
    // 1. Precompilar expressoes (RegEx) com base nas regras (otimização massiva de cache local para O(1) matching vs re-instanciação)
    final compiledRules = <ClassificationRuleEntity, RegExp>{};
    for (var rule in rules) {
      compiledRules[rule] = RegExp(rule.regexPattern, caseSensitive: false);
    }
    
    // Sort das regras por prioridade de peso (maior resolve primeiro)
    rules.sort((a, b) => b.priorityWeight.compareTo(a.priorityWeight));

    final categorized = transactions.map((t) {
      String? matchedCategory;
      for (var rule in rules) {
        if (compiledRules[rule]!.hasMatch(t.rawDescription)) {
          matchedCategory = rule.targetCategory;
          break; // Match garantido, encerra O(n) prematuro na string
        }
      }
      return matchedCategory != null 
        ? t.copyWith(resolvedCategory: matchedCategory) 
        : t;
    }).toList();

    return Right(categorized);
  }
}
