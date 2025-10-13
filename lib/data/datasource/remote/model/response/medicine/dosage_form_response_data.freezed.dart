// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dosage_form_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DosageFormResponseData {

@JsonKey(name: 'dosage_form_id') int get dosageFormId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'slug') String get slug;@JsonKey(name: 'generics_count') int get genericsCount;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of DosageFormResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DosageFormResponseDataCopyWith<DosageFormResponseData> get copyWith => _$DosageFormResponseDataCopyWithImpl<DosageFormResponseData>(this as DosageFormResponseData, _$identity);

  /// Serializes this DosageFormResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DosageFormResponseData&&(identical(other.dosageFormId, dosageFormId) || other.dosageFormId == dosageFormId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.genericsCount, genericsCount) || other.genericsCount == genericsCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dosageFormId,name,slug,genericsCount,createdAt,updatedAt);

@override
String toString() {
  return 'DosageFormResponseData(dosageFormId: $dosageFormId, name: $name, slug: $slug, genericsCount: $genericsCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DosageFormResponseDataCopyWith<$Res>  {
  factory $DosageFormResponseDataCopyWith(DosageFormResponseData value, $Res Function(DosageFormResponseData) _then) = _$DosageFormResponseDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dosage_form_id') int dosageFormId,@JsonKey(name: 'name') String name,@JsonKey(name: 'slug') String slug,@JsonKey(name: 'generics_count') int genericsCount,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$DosageFormResponseDataCopyWithImpl<$Res>
    implements $DosageFormResponseDataCopyWith<$Res> {
  _$DosageFormResponseDataCopyWithImpl(this._self, this._then);

  final DosageFormResponseData _self;
  final $Res Function(DosageFormResponseData) _then;

/// Create a copy of DosageFormResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dosageFormId = null,Object? name = null,Object? slug = null,Object? genericsCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
dosageFormId: null == dosageFormId ? _self.dosageFormId : dosageFormId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,genericsCount: null == genericsCount ? _self.genericsCount : genericsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DosageFormResponseData].
extension DosageFormResponseDataPatterns on DosageFormResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DosageFormResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DosageFormResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DosageFormResponseData value)  $default,){
final _that = this;
switch (_that) {
case _DosageFormResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DosageFormResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _DosageFormResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dosage_form_id')  int dosageFormId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'generics_count')  int genericsCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DosageFormResponseData() when $default != null:
return $default(_that.dosageFormId,_that.name,_that.slug,_that.genericsCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dosage_form_id')  int dosageFormId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'generics_count')  int genericsCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DosageFormResponseData():
return $default(_that.dosageFormId,_that.name,_that.slug,_that.genericsCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dosage_form_id')  int dosageFormId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'generics_count')  int genericsCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DosageFormResponseData() when $default != null:
return $default(_that.dosageFormId,_that.name,_that.slug,_that.genericsCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DosageFormResponseData implements DosageFormResponseData {
  const _DosageFormResponseData({@JsonKey(name: 'dosage_form_id') required this.dosageFormId, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'slug') required this.slug, @JsonKey(name: 'generics_count') required this.genericsCount, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _DosageFormResponseData.fromJson(Map<String, dynamic> json) => _$DosageFormResponseDataFromJson(json);

@override@JsonKey(name: 'dosage_form_id') final  int dosageFormId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'slug') final  String slug;
@override@JsonKey(name: 'generics_count') final  int genericsCount;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of DosageFormResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DosageFormResponseDataCopyWith<_DosageFormResponseData> get copyWith => __$DosageFormResponseDataCopyWithImpl<_DosageFormResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DosageFormResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DosageFormResponseData&&(identical(other.dosageFormId, dosageFormId) || other.dosageFormId == dosageFormId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.genericsCount, genericsCount) || other.genericsCount == genericsCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dosageFormId,name,slug,genericsCount,createdAt,updatedAt);

@override
String toString() {
  return 'DosageFormResponseData(dosageFormId: $dosageFormId, name: $name, slug: $slug, genericsCount: $genericsCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DosageFormResponseDataCopyWith<$Res> implements $DosageFormResponseDataCopyWith<$Res> {
  factory _$DosageFormResponseDataCopyWith(_DosageFormResponseData value, $Res Function(_DosageFormResponseData) _then) = __$DosageFormResponseDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dosage_form_id') int dosageFormId,@JsonKey(name: 'name') String name,@JsonKey(name: 'slug') String slug,@JsonKey(name: 'generics_count') int genericsCount,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$DosageFormResponseDataCopyWithImpl<$Res>
    implements _$DosageFormResponseDataCopyWith<$Res> {
  __$DosageFormResponseDataCopyWithImpl(this._self, this._then);

  final _DosageFormResponseData _self;
  final $Res Function(_DosageFormResponseData) _then;

/// Create a copy of DosageFormResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dosageFormId = null,Object? name = null,Object? slug = null,Object? genericsCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DosageFormResponseData(
dosageFormId: null == dosageFormId ? _self.dosageFormId : dosageFormId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,genericsCount: null == genericsCount ? _self.genericsCount : genericsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
