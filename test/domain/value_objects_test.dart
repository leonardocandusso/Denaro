import 'package:flutter_test/flutter_test.dart';
import 'package:denaro/domain/entities/value_objects.dart';

void main() {
  group('Value Object: TransactionAmount', () {
    test('Deve retornar Failure se tentarem criar montantes monetarios irreais (NaN / Infinity)', () {
      final amount = TransactionAmount.create(double.nan);
      expect(amount.isLeft(), isTrue); // FPDart: Left = Failure
    });

    test('Deve aceitar criacao de montante via String perfeitamente formatada', () {
      final amount = TransactionAmount.createFromString(" - 300.75 ");
      expect(amount.isRight(), isTrue); // FPDart: Right = Success
      
      amount.match(
        (l) => fail('Teria que gerar direito.'), 
        (r) => expect(r.value, -300.75)
      );
    });

    test('Sec: Deve bloquear silenciosamente Strings maliciosas ou lixo no CSV', () {
      final amount = TransactionAmount.createFromString("200.50 DROP TABLE users;");
      expect(amount.isLeft(), isTrue);
      
      amount.match(
        (failure) => expect(failure.message, contains('indevidos')),
        (r) => fail('Deixou injetar payload SQL como montante!')
      );
    });
  });
}
