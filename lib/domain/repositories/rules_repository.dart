import 'package:fpdart/fpdart.dart';
import '../entities/classification_rule_entity.dart';
import '../entities/value_objects.dart';

/// Justificativa de Engenharia: A porta do Repositório assegura que o Motor 
/// de Análise no UseCase apenas extraia as regras ativas, isolando a engine
/// da infraestrutura de DB local criptografado.
abstract class RulesRepository {
  Future<Either<ValueFailure, List<ClassificationRuleEntity>>> getAllActiveRules();
}
