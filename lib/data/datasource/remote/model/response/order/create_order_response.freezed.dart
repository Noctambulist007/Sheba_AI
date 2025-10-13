// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOrderResponse {

@JsonKey(name: 'shipping_address') String get shippingAddress;@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'notes') String? get notes;
/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderResponseCopyWith<CreateOrderResponse> get copyWith => _$CreateOrderResponseCopyWithImpl<CreateOrderResponse>(this as CreateOrderResponse, _$identity);

  /// Serializes this CreateOrderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderResponse&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shippingAddress,phoneNumber,paymentMethod,notes);

@override
String toString() {
  return 'CreateOrderResponse(shippingAddress: $shippingAddress, phoneNumber: $phoneNumber, paymentMethod: $paymentMethod, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateOrderResponseCopyWith<$Res>  {
  factory $CreateOrderResponseCopyWith(CreateOrderResponse value, $Res Function(CreateOrderResponse) _then) = _$CreateOrderResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shipping_address') String shippingAddress,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class _$CreateOrderResponseCopyWithImpl<$Res>
    implements $CreateOrderResponseCopyWith<$Res> {
  _$CreateOrderResponseCopyWithImpl(this._self, this._then);

  final CreateOrderResponse _self;
  final $Res Function(CreateOrderResponse) _then;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shippingAddress = null,Object? phoneNumber = null,Object? paymentMethod = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderResponse].
extension CreateOrderResponsePatterns on CreateOrderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
return $default(_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResponse():
return $default(_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
return $default(_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderResponse implements CreateOrderResponse {
  const _CreateOrderResponse({@JsonKey(name: 'shipping_address') required this.shippingAddress, @JsonKey(name: 'phone_number') required this.phoneNumber, @JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'notes') this.notes});
  factory _CreateOrderResponse.fromJson(Map<String, dynamic> json) => _$CreateOrderResponseFromJson(json);

@override@JsonKey(name: 'shipping_address') final  String shippingAddress;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'notes') final  String? notes;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderResponseCopyWith<_CreateOrderResponse> get copyWith => __$CreateOrderResponseCopyWithImpl<_CreateOrderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderResponse&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shippingAddress,phoneNumber,paymentMethod,notes);

@override
String toString() {
  return 'CreateOrderResponse(shippingAddress: $shippingAddress, phoneNumber: $phoneNumber, paymentMethod: $paymentMethod, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderResponseCopyWith<$Res> implements $CreateOrderResponseCopyWith<$Res> {
  factory _$CreateOrderResponseCopyWith(_CreateOrderResponse value, $Res Function(_CreateOrderResponse) _then) = __$CreateOrderResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shipping_address') String shippingAddress,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class __$CreateOrderResponseCopyWithImpl<$Res>
    implements _$CreateOrderResponseCopyWith<$Res> {
  __$CreateOrderResponseCopyWithImpl(this._self, this._then);

  final _CreateOrderResponse _self;
  final $Res Function(_CreateOrderResponse) _then;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shippingAddress = null,Object? phoneNumber = null,Object? paymentMethod = null,Object? notes = freezed,}) {
  return _then(_CreateOrderResponse(
shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
