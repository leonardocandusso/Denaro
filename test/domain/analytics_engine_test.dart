import 'package:flutter_test/flutter_test.dart';
import 'package:denaro/domain/usecases/analytics_engine_usecase.dart';
import 'package:denaro/domain/entities/transaction_entity.dart';
import 'package:denaro/domain/entities/classification_rule_entity.dart';
import 'package:denaro/domain/entities/value_objects.dart';

void main() {
  group('UseCase: AnalyticsEngineUseCase (O(N) Classification)', () {
    test('Deve aplicar categoria corretamente priorizando o maior peso numerico (PriorityWeight)', () async {
      
      final amountOrWait = TransactionAmount.create(50.0);
      final transaction = TransactionEntity(
        id: '1', 
        amount: amountOrWait.getOrElse((l) => throw Exception()), 
        rawDescription: 'UBER *PAGAMENTO TRIP', 
        transactionDate: DateTime.now()
      );

      final rules = [
        ClassificationRuleEntity(ruleId: 'r1', regexPattern: 'UBER', targetCategory: 'Transporte Genérico', priorityWeight: 1),
        ClassificationRuleEntity(ruleId: 'r2', regexPattern: 'UBER \\*PAGAMENTO', targetCategory: 'Transporte App Específico', priorityWeight: 10), // Regex mais agressiva e com prioridade
      ];

      final engine = AnalyticsEngineUseCase();
      final result = await engine.classifyTransactions([transaction], rules);

      expect(result.isRight(), isTrue);
      result.match(
        (l) => fail('Falhou'), 
        (list) {
          expect(list.first.resolvedCategory, 'Transporte App Específico');
        }
      );
    });
  });
}
