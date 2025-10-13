// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manufacturer_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManufacturerResponseData {

@JsonKey(name: 'manufacturer_id') int get manufacturerId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'slug') String get slug;@JsonKey(name: 'generics_count') int get genericsCount;@JsonKey(name: 'brand_names_count') int get brandNamesCount;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of ManufacturerResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManufacturerResponseDataCopyWith<ManufacturerResponseData> get copyWith => _$ManufacturerResponseDataCopyWithImpl<ManufacturerResponseData>(this as ManufacturerResponseData, _$identity);

  /// Serializes this ManufacturerResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManufacturerResponseData&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.genericsCount, genericsCount) || other.genericsCount == genericsCount)&&(identical(other.brandNamesCount, brandNamesCount) || other.brandNamesCount == brandNamesCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,manufacturerId,name,slug,genericsCount,brandNamesCount,createdAt,updatedAt);

@override
String toString() {
  return 'ManufacturerResponseData(manufacturerId: $manufacturerId, name: $name, slug: $slug, genericsCount: $genericsCount, brandNamesCount: $brandNamesCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ManufacturerResponseDataCopyWith<$Res>  {
  factory $ManufacturerResponseDataCopyWith(ManufacturerResponseData value, $Res Function(ManufacturerResponseData) _then) = _$ManufacturerResponseDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'manufacturer_id') int manufacturerId,@JsonKey(name: 'name') String name,@JsonKey(name: 'slug') String slug,@JsonKey(name: 'generics_count') int genericsCount,@JsonKey(name: 'brand_names_count') int brandNamesCount,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$ManufacturerResponseDataCopyWithImpl<$Res>
    implements $ManufacturerResponseDataCopyWith<$Res> {
  _$ManufacturerResponseDataCopyWithImpl(this._self, this._then);

  final ManufacturerResponseData _self;
  final $Res Function(ManufacturerResponseData) _then;

/// Create a copy of ManufacturerResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? manufacturerId = null,Object? name = null,Object? slug = null,Object? genericsCount = null,Object? brandNamesCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
manufacturerId: null == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,genericsCount: null == genericsCount ? _self.genericsCount : genericsCount // ignore: cast_nullable_to_non_nullable
as int,brandNamesCount: null == brandNamesCount ? _self.brandNamesCount : brandNamesCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManufacturerResponseData].
extension ManufacturerResponseDataPatterns on ManufacturerResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManufacturerResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManufacturerResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManufacturerResponseData value)  $default,){
final _that = this;
switch (_that) {
case _ManufacturerResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManufacturerResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _ManufacturerResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'generics_count')  int genericsCount, @JsonKey(name: 'brand_names_count')  int brandNamesCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManufacturerResponseData() when $default != null:
return $default(_that.manufacturerId,_that.name,_that.slug,_that.genericsCount,_that.brandNamesCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'generics_count')  int genericsCount, @JsonKey(name: 'brand_names_count')  int brandNamesCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ManufacturerResponseData():
return $default(_that.manufacturerId,_that.name,_that.slug,_that.genericsCount,_that.brandNamesCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'manufacturer_id')  int manufacturerId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'generics_count')  int genericsCount, @JsonKey(name: 'brand_names_count')  int brandNamesCount, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ManufacturerResponseData() when $default != null:
return $default(_that.manufacturerId,_that.name,_that.slug,_that.genericsCount,_that.brandNamesCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManufacturerResponseData implements ManufacturerResponseData {
  const _ManufacturerResponseData({@JsonKey(name: 'manufacturer_id') required this.manufacturerId, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'slug') required this.slug, @JsonKey(name: 'generics_count') required this.genericsCount, @JsonKey(name: 'brand_names_count') required this.brandNamesCount, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ManufacturerResponseData.fromJson(Map<String, dynamic> json) => _$ManufacturerResponseDataFromJson(json);

@override@JsonKey(name: 'manufacturer_id') final  int manufacturerId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'slug') final  String slug;
@override@JsonKey(name: 'generics_count') final  int genericsCount;
@override@JsonKey(name: 'brand_names_count') final  int brandNamesCount;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of ManufacturerResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManufacturerResponseDataCopyWith<_ManufacturerResponseData> get copyWith => __$ManufacturerResponseDataCopyWithImpl<_ManufacturerResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManufacturerResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManufacturerResponseData&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.genericsCount, genericsCount) || other.genericsCount == genericsCount)&&(identical(other.brandNamesCount, brandNamesCount) || other.brandNamesCount == brandNamesCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,manufacturerId,name,slug,genericsCount,brandNamesCount,createdAt,updatedAt);

@override
String toString() {
  return 'ManufacturerResponseData(manufacturerId: $manufacturerId, name: $name, slug: $slug, genericsCount: $genericsCount, brandNamesCount: $brandNamesCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ManufacturerResponseDataCopyWith<$Res> implements $ManufacturerResponseDataCopyWith<$Res> {
  factory _$ManufacturerResponseDataCopyWith(_ManufacturerResponseData value, $Res Function(_ManufacturerResponseData) _then) = __$ManufacturerResponseDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'manufacturer_id') int manufacturerId,@JsonKey(name: 'name') String name,@JsonKey(name: 'slug') String slug,@JsonKey(name: 'generics_count') int genericsCount,@JsonKey(name: 'brand_names_count') int brandNamesCount,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$ManufacturerResponseDataCopyWithImpl<$Res>
    implements _$ManufacturerResponseDataCopyWith<$Res> {
  __$ManufacturerResponseDataCopyWithImpl(this._self, this._then);

  final _ManufacturerResponseData _self;
  final $Res Function(_ManufacturerResponseData) _then;

/// Create a copy of ManufacturerResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? manufacturerId = null,Object? name = null,Object? slug = null,Object? genericsCount = null,Object? brandNamesCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ManufacturerResponseData(
manufacturerId: null == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,genericsCount: null == genericsCount ? _self.genericsCount : genericsCount // ignore: cast_nullable_to_non_nullable
as int,brandNamesCount: null == brandNamesCount ? _self.brandNamesCount : brandNamesCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
