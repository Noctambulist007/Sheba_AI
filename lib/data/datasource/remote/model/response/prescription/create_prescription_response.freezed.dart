// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_prescription_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePrescriptionResponse {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'image') String get image;
/// Create a copy of CreatePrescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePrescriptionResponseCopyWith<CreatePrescriptionResponse> get copyWith => _$CreatePrescriptionResponseCopyWithImpl<CreatePrescriptionResponse>(this as CreatePrescriptionResponse, _$identity);

  /// Serializes this CreatePrescriptionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePrescriptionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image);

@override
String toString() {
  return 'CreatePrescriptionResponse(id: $id, image: $image)';
}


}

/// @nodoc
abstract mixin class $CreatePrescriptionResponseCopyWith<$Res>  {
  factory $CreatePrescriptionResponseCopyWith(CreatePrescriptionResponse value, $Res Function(CreatePrescriptionResponse) _then) = _$CreatePrescriptionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'image') String image
});




}
/// @nodoc
class _$CreatePrescriptionResponseCopyWithImpl<$Res>
    implements $CreatePrescriptionResponseCopyWith<$Res> {
  _$CreatePrescriptionResponseCopyWithImpl(this._self, this._then);

  final CreatePrescriptionResponse _self;
  final $Res Function(CreatePrescriptionResponse) _then;

/// Create a copy of CreatePrescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePrescriptionResponse].
extension CreatePrescriptionResponsePatterns on CreatePrescriptionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePrescriptionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePrescriptionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePrescriptionResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreatePrescriptionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePrescriptionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePrescriptionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'image')  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePrescriptionResponse() when $default != null:
return $default(_that.id,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'image')  String image)  $default,) {final _that = this;
switch (_that) {
case _CreatePrescriptionResponse():
return $default(_that.id,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'image')  String image)?  $default,) {final _that = this;
switch (_that) {
case _CreatePrescriptionResponse() when $default != null:
return $default(_that.id,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePrescriptionResponse implements CreatePrescriptionResponse {
  const _CreatePrescriptionResponse({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'image') required this.image});
  factory _CreatePrescriptionResponse.fromJson(Map<String, dynamic> json) => _$CreatePrescriptionResponseFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'image') final  String image;

/// Create a copy of CreatePrescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePrescriptionResponseCopyWith<_CreatePrescriptionResponse> get copyWith => __$CreatePrescriptionResponseCopyWithImpl<_CreatePrescriptionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePrescriptionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePrescriptionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image);

@override
String toString() {
  return 'CreatePrescriptionResponse(id: $id, image: $image)';
}


}

/// @nodoc
abstract mixin class _$CreatePrescriptionResponseCopyWith<$Res> implements $CreatePrescriptionResponseCopyWith<$Res> {
  factory _$CreatePrescriptionResponseCopyWith(_CreatePrescriptionResponse value, $Res Function(_CreatePrescriptionResponse) _then) = __$CreatePrescriptionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'image') String image
});




}
/// @nodoc
class __$CreatePrescriptionResponseCopyWithImpl<$Res>
    implements _$CreatePrescriptionResponseCopyWith<$Res> {
  __$CreatePrescriptionResponseCopyWithImpl(this._self, this._then);

  final _CreatePrescriptionResponse _self;
  final $Res Function(_CreatePrescriptionResponse) _then;

/// Create a copy of CreatePrescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? image = null,}) {
  return _then(_CreatePrescriptionResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
