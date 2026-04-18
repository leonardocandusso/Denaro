import 'package:flutter_test/flutter_test.dart';
import 'package:denaro/domain/usecases/csv_parser_usecase.dart';

void main() {
  group('UseCase: CsvParserUseCase (TDD & Anti-ReDoS)', () {
    test('Sec: Rejeicao Catastrophic Backtracking - truncar linhas superlongas', () async {
      // String massiva que travaria Regex comuns (ReDoS limit test)
      final maliciousPayload = "12/12/2026;${"A" * 15000};-50.00"; 
      
      final parser = CsvParserUseCase();
      final result = await parser.parseRawString(maliciousPayload);

      expect(result.isLeft(), isTrue);
      result.match(
        (failure) => expect(failure.message, contains('maliciosas')), 
        (_) => fail('Payload longo sobreviveu!')
      );
    });

    test('Engine: Sucesso ao decifrar e unificar as classes Freezed num payload comum', () async {
      final validCsv = "08/10/2026;UBER *TRIP;-25.50\n10/10/2026;SALARIO;5000.00";
      
      final parser = CsvParserUseCase();
      final result = await parser.parseRawString(validCsv);

      expect(result.isRight(), isTrue);
      result.match(
        (_) => fail('Nao poderia falhar em formato valido'), 
        (transactions) {
          expect(transactions.length, 2);
          expect(transactions.first.rawDescription, 'UBER *TRIP');
          // TransactionAmount selou o internal property value imutavel
          expect(transactions.last.amount.value, 5000.00); 
        }
      );
    });
  });
}
