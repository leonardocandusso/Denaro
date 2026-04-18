// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classification_rule_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClassificationRuleEntity {

 String get ruleId; String get regexPattern; String get targetCategory; int get priorityWeight;
/// Create a copy of ClassificationRuleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassificationRuleEntityCopyWith<ClassificationRuleEntity> get copyWith => _$ClassificationRuleEntityCopyWithImpl<ClassificationRuleEntity>(this as ClassificationRuleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassificationRuleEntity&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.regexPattern, regexPattern) || other.regexPattern == regexPattern)&&(identical(other.targetCategory, targetCategory) || other.targetCategory == targetCategory)&&(identical(other.priorityWeight, priorityWeight) || other.priorityWeight == priorityWeight));
}


@override
int get hashCode => Object.hash(runtimeType,ruleId,regexPattern,targetCategory,priorityWeight);

@override
String toString() {
  return 'ClassificationRuleEntity(ruleId: $ruleId, regexPattern: $regexPattern, targetCategory: $targetCategory, priorityWeight: $priorityWeight)';
}


}

/// @nodoc
abstract mixin class $ClassificationRuleEntityCopyWith<$Res>  {
  factory $ClassificationRuleEntityCopyWith(ClassificationRuleEntity value, $Res Function(ClassificationRuleEntity) _then) = _$ClassificationRuleEntityCopyWithImpl;
@useResult
$Res call({
 String ruleId, String regexPattern, String targetCategory, int priorityWeight
});




}
/// @nodoc
class _$ClassificationRuleEntityCopyWithImpl<$Res>
    implements $ClassificationRuleEntityCopyWith<$Res> {
  _$ClassificationRuleEntityCopyWithImpl(this._self, this._then);

  final ClassificationRuleEntity _self;
  final $Res Function(ClassificationRuleEntity) _then;

/// Create a copy of ClassificationRuleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ruleId = null,Object? regexPattern = null,Object? targetCategory = null,Object? priorityWeight = null,}) {
  return _then(_self.copyWith(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,regexPattern: null == regexPattern ? _self.regexPattern : regexPattern // ignore: cast_nullable_to_non_nullable
as String,targetCategory: null == targetCategory ? _self.targetCategory : targetCategory // ignore: cast_nullable_to_non_nullable
as String,priorityWeight: null == priorityWeight ? _self.priorityWeight : priorityWeight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClassificationRuleEntity].
extension ClassificationRuleEntityPatterns on ClassificationRuleEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClassificationRuleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClassificationRuleEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClassificationRuleEntity value)  $default,){
final _that = this;
switch (_that) {
case _ClassificationRuleEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClassificationRuleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ClassificationRuleEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ruleId,  String regexPattern,  String targetCategory,  int priorityWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClassificationRuleEntity() when $default != null:
return $default(_that.ruleId,_that.regexPattern,_that.targetCategory,_that.priorityWeight);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ruleId,  String regexPattern,  String targetCategory,  int priorityWeight)  $default,) {final _that = this;
switch (_that) {
case _ClassificationRuleEntity():
return $default(_that.ruleId,_that.regexPattern,_that.targetCategory,_that.priorityWeight);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ruleId,  String regexPattern,  String targetCategory,  int priorityWeight)?  $default,) {final _that = this;
switch (_that) {
case _ClassificationRuleEntity() when $default != null:
return $default(_that.ruleId,_that.regexPattern,_that.targetCategory,_that.priorityWeight);case _:
  return null;

}
}

}

/// @nodoc


class _ClassificationRuleEntity implements ClassificationRuleEntity {
  const _ClassificationRuleEntity({required this.ruleId, required this.regexPattern, required this.targetCategory, required this.priorityWeight});
  

@override final  String ruleId;
@override final  String regexPattern;
@override final  String targetCategory;
@override final  int priorityWeight;

/// Create a copy of ClassificationRuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassificationRuleEntityCopyWith<_ClassificationRuleEntity> get copyWith => __$ClassificationRuleEntityCopyWithImpl<_ClassificationRuleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassificationRuleEntity&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.regexPattern, regexPattern) || other.regexPattern == regexPattern)&&(identical(other.targetCategory, targetCategory) || other.targetCategory == targetCategory)&&(identical(other.priorityWeight, priorityWeight) || other.priorityWeight == priorityWeight));
}


@override
int get hashCode => Object.hash(runtimeType,ruleId,regexPattern,targetCategory,priorityWeight);

@override
String toString() {
  return 'ClassificationRuleEntity(ruleId: $ruleId, regexPattern: $regexPattern, targetCategory: $targetCategory, priorityWeight: $priorityWeight)';
}


}

/// @nodoc
abstract mixin class _$ClassificationRuleEntityCopyWith<$Res> implements $ClassificationRuleEntityCopyWith<$Res> {
  factory _$ClassificationRuleEntityCopyWith(_ClassificationRuleEntity value, $Res Function(_ClassificationRuleEntity) _then) = __$ClassificationRuleEntityCopyWithImpl;
@override @useResult
$Res call({
 String ruleId, String regexPattern, String targetCategory, int priorityWeight
});




}
/// @nodoc
class __$ClassificationRuleEntityCopyWithImpl<$Res>
    implements _$ClassificationRuleEntityCopyWith<$Res> {
  __$ClassificationRuleEntityCopyWithImpl(this._self, this._then);

  final _ClassificationRuleEntity _self;
  final $Res Function(_ClassificationRuleEntity) _then;

/// Create a copy of ClassificationRuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ruleId = null,Object? regexPattern = null,Object? targetCategory = null,Object? priorityWeight = null,}) {
  return _then(_ClassificationRuleEntity(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,regexPattern: null == regexPattern ? _self.regexPattern : regexPattern // ignore: cast_nullable_to_non_nullable
as String,targetCategory: null == targetCategory ? _self.targetCategory : targetCategory // ignore: cast_nullable_to_non_nullable
as String,priorityWeight: null == priorityWeight ? _self.priorityWeight : priorityWeight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
