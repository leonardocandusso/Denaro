import 'package:fpdart/fpdart.dart';
import 'package:equatable/equatable.dart';

class ValueFailure extends Equatable {
  final String message;
  const ValueFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class TransactionAmount extends Equatable {
  final double value;

  // Construtor puramente privado (Domain-Driven Design). 
  // Instanciacao apenas ocorre pelas rotas auditadas abaixo.
  const TransactionAmount._(this.value);

  static Either<ValueFailure, TransactionAmount> create(double value) {
    if (value.isNaN || value.isInfinite) {
      return const Left(ValueFailure('Montante numerico invalido (NaN/Infinite).'));
    }
    return Right(TransactionAmount._(value));
  }

  static Either<ValueFailure, TransactionAmount> createFromString(String rawValue) {
    // 1. Mitigação básica de tamanho (excesso massivo trava Regex dps)
    if (rawValue.length > 50) {
      return const Left(ValueFailure('Montante excede limite seguro de leitura.'));
    }

    // 2. Não deve extrair numeros de lixo ("20 DROP") pois isso mascara corrompimentos
    if (RegExp(r'[a-zA-Z;=]').hasMatch(rawValue)) {
      return const Left(ValueFailure('Dado monetario contem caracteres indevidos (letras ou injeções).'));
    }

    final sanitized = rawValue.replaceAll(RegExp(r'[^0-9\.\-]'), '');
    
    if (sanitized.isEmpty) {
      return const Left(ValueFailure('Dado monetario mal formatado vazio.'));
    }

    final parsed = double.tryParse(sanitized);

    // Se o double.parse falhar (ex: "DROP TABLE" que viraria string vazia e quebraria 
    // ou ".200.50--" mal construido), ele devolvera validacao deterministica.
    if (parsed == null) {
      return const Left(ValueFailure('Dado monetario mal formatado no arquivo bruto.'));
    }
    
    return create(parsed);
  }

  @override
  List<Object?> get props => [value];
}
