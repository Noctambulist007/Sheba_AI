// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_prescription_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePrescriptionRequest {

@JsonKey(name: 'image') String get image;
/// Create a copy of CreatePrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePrescriptionRequestCopyWith<CreatePrescriptionRequest> get copyWith => _$CreatePrescriptionRequestCopyWithImpl<CreatePrescriptionRequest>(this as CreatePrescriptionRequest, _$identity);

  /// Serializes this CreatePrescriptionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePrescriptionRequest&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'CreatePrescriptionRequest(image: $image)';
}


}

/// @nodoc
abstract mixin class $CreatePrescriptionRequestCopyWith<$Res>  {
  factory $CreatePrescriptionRequestCopyWith(CreatePrescriptionRequest value, $Res Function(CreatePrescriptionRequest) _then) = _$CreatePrescriptionRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'image') String image
});




}
/// @nodoc
class _$CreatePrescriptionRequestCopyWithImpl<$Res>
    implements $CreatePrescriptionRequestCopyWith<$Res> {
  _$CreatePrescriptionRequestCopyWithImpl(this._self, this._then);

  final CreatePrescriptionRequest _self;
  final $Res Function(CreatePrescriptionRequest) _then;

/// Create a copy of CreatePrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,}) {
  return _then(_self.copyWith(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePrescriptionRequest].
extension CreatePrescriptionRequestPatterns on CreatePrescriptionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePrescriptionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePrescriptionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePrescriptionRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreatePrescriptionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePrescriptionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePrescriptionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'image')  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePrescriptionRequest() when $default != null:
return $default(_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'image')  String image)  $default,) {final _that = this;
switch (_that) {
case _CreatePrescriptionRequest():
return $default(_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'image')  String image)?  $default,) {final _that = this;
switch (_that) {
case _CreatePrescriptionRequest() when $default != null:
return $default(_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePrescriptionRequest implements CreatePrescriptionRequest {
  const _CreatePrescriptionRequest({@JsonKey(name: 'image') required this.image});
  factory _CreatePrescriptionRequest.fromJson(Map<String, dynamic> json) => _$CreatePrescriptionRequestFromJson(json);

@override@JsonKey(name: 'image') final  String image;

/// Create a copy of CreatePrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePrescriptionRequestCopyWith<_CreatePrescriptionRequest> get copyWith => __$CreatePrescriptionRequestCopyWithImpl<_CreatePrescriptionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePrescriptionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePrescriptionRequest&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'CreatePrescriptionRequest(image: $image)';
}


}

/// @nodoc
abstract mixin class _$CreatePrescriptionRequestCopyWith<$Res> implements $CreatePrescriptionRequestCopyWith<$Res> {
  factory _$CreatePrescriptionRequestCopyWith(_CreatePrescriptionRequest value, $Res Function(_CreatePrescriptionRequest) _then) = __$CreatePrescriptionRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'image') String image
});




}
/// @nodoc
class __$CreatePrescriptionRequestCopyWithImpl<$Res>
    implements _$CreatePrescriptionRequestCopyWith<$Res> {
  __$CreatePrescriptionRequestCopyWithImpl(this._self, this._then);

  final _CreatePrescriptionRequest _self;
  final $Res Function(_CreatePrescriptionRequest) _then;

/// Create a copy of CreatePrescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_CreatePrescriptionRequest(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
