import 'package:freezed_annotation/freezed_annotation.dart';

part 'classification_rule_entity.freezed.dart';

@freezed
abstract class ClassificationRuleEntity with _$ClassificationRuleEntity {
  const factory ClassificationRuleEntity({
    required String ruleId,
    required String regexPattern,
    required String targetCategory,
    required int priorityWeight, // Ordem de resolucao (1-10)
  }) = _ClassificationRuleEntity;
}
