// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matched_medicine_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchedMedicineResponse {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'generic_name') String get genericName;@JsonKey(name: 'price') String get price;
/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchedMedicineResponseCopyWith<MatchedMedicineResponse> get copyWith => _$MatchedMedicineResponseCopyWithImpl<MatchedMedicineResponse>(this as MatchedMedicineResponse, _$identity);

  /// Serializes this MatchedMedicineResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchedMedicineResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,genericName,price);

@override
String toString() {
  return 'MatchedMedicineResponse(id: $id, name: $name, genericName: $genericName, price: $price)';
}


}

/// @nodoc
abstract mixin class $MatchedMedicineResponseCopyWith<$Res>  {
  factory $MatchedMedicineResponseCopyWith(MatchedMedicineResponse value, $Res Function(MatchedMedicineResponse) _then) = _$MatchedMedicineResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'generic_name') String genericName,@JsonKey(name: 'price') String price
});




}
/// @nodoc
class _$MatchedMedicineResponseCopyWithImpl<$Res>
    implements $MatchedMedicineResponseCopyWith<$Res> {
  _$MatchedMedicineResponseCopyWithImpl(this._self, this._then);

  final MatchedMedicineResponse _self;
  final $Res Function(MatchedMedicineResponse) _then;

/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? genericName = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,genericName: null == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchedMedicineResponse].
extension MatchedMedicineResponsePatterns on MatchedMedicineResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchedMedicineResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchedMedicineResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchedMedicineResponse value)  $default,){
final _that = this;
switch (_that) {
case _MatchedMedicineResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchedMedicineResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MatchedMedicineResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'generic_name')  String genericName, @JsonKey(name: 'price')  String price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchedMedicineResponse() when $default != null:
return $default(_that.id,_that.name,_that.genericName,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'generic_name')  String genericName, @JsonKey(name: 'price')  String price)  $default,) {final _that = this;
switch (_that) {
case _MatchedMedicineResponse():
return $default(_that.id,_that.name,_that.genericName,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'generic_name')  String genericName, @JsonKey(name: 'price')  String price)?  $default,) {final _that = this;
switch (_that) {
case _MatchedMedicineResponse() when $default != null:
return $default(_that.id,_that.name,_that.genericName,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchedMedicineResponse implements MatchedMedicineResponse {
  const _MatchedMedicineResponse({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'generic_name') required this.genericName, @JsonKey(name: 'price') required this.price});
  factory _MatchedMedicineResponse.fromJson(Map<String, dynamic> json) => _$MatchedMedicineResponseFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'generic_name') final  String genericName;
@override@JsonKey(name: 'price') final  String price;

/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchedMedicineResponseCopyWith<_MatchedMedicineResponse> get copyWith => __$MatchedMedicineResponseCopyWithImpl<_MatchedMedicineResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchedMedicineResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchedMedicineResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,genericName,price);

@override
String toString() {
  return 'MatchedMedicineResponse(id: $id, name: $name, genericName: $genericName, price: $price)';
}


}

/// @nodoc
abstract mixin class _$MatchedMedicineResponseCopyWith<$Res> implements $MatchedMedicineResponseCopyWith<$Res> {
  factory _$MatchedMedicineResponseCopyWith(_MatchedMedicineResponse value, $Res Function(_MatchedMedicineResponse) _then) = __$MatchedMedicineResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'generic_name') String genericName,@JsonKey(name: 'price') String price
});




}
/// @nodoc
class __$MatchedMedicineResponseCopyWithImpl<$Res>
    implements _$MatchedMedicineResponseCopyWith<$Res> {
  __$MatchedMedicineResponseCopyWithImpl(this._self, this._then);

  final _MatchedMedicineResponse _self;
  final $Res Function(_MatchedMedicineResponse) _then;

/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? genericName = null,Object? price = null,}) {
  return _then(_MatchedMedicineResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,genericName: null == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
