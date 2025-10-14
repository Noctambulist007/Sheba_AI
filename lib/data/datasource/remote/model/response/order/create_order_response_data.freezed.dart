// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOrderResponseData {

@JsonKey(name: 'order_number') String get orderNumber;@JsonKey(name: 'shipping_address') String get shippingAddress;@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'notes') String? get notes;
/// Create a copy of CreateOrderResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderResponseDataCopyWith<CreateOrderResponseData> get copyWith => _$CreateOrderResponseDataCopyWithImpl<CreateOrderResponseData>(this as CreateOrderResponseData, _$identity);

  /// Serializes this CreateOrderResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderResponseData&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderNumber,shippingAddress,phoneNumber,paymentMethod,notes);

@override
String toString() {
  return 'CreateOrderResponseData(orderNumber: $orderNumber, shippingAddress: $shippingAddress, phoneNumber: $phoneNumber, paymentMethod: $paymentMethod, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateOrderResponseDataCopyWith<$Res>  {
  factory $CreateOrderResponseDataCopyWith(CreateOrderResponseData value, $Res Function(CreateOrderResponseData) _then) = _$CreateOrderResponseDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order_number') String orderNumber,@JsonKey(name: 'shipping_address') String shippingAddress,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class _$CreateOrderResponseDataCopyWithImpl<$Res>
    implements $CreateOrderResponseDataCopyWith<$Res> {
  _$CreateOrderResponseDataCopyWithImpl(this._self, this._then);

  final CreateOrderResponseData _self;
  final $Res Function(CreateOrderResponseData) _then;

/// Create a copy of CreateOrderResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderNumber = null,Object? shippingAddress = null,Object? phoneNumber = null,Object? paymentMethod = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderResponseData].
extension CreateOrderResponseDataPatterns on CreateOrderResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderResponseData value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderResponseData() when $default != null:
return $default(_that.orderNumber,_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResponseData():
return $default(_that.orderNumber,_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResponseData() when $default != null:
return $default(_that.orderNumber,_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderResponseData implements CreateOrderResponseData {
  const _CreateOrderResponseData({@JsonKey(name: 'order_number') required this.orderNumber, @JsonKey(name: 'shipping_address') required this.shippingAddress, @JsonKey(name: 'phone_number') required this.phoneNumber, @JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'notes') this.notes});
  factory _CreateOrderResponseData.fromJson(Map<String, dynamic> json) => _$CreateOrderResponseDataFromJson(json);

@override@JsonKey(name: 'order_number') final  String orderNumber;
@override@JsonKey(name: 'shipping_address') final  String shippingAddress;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'notes') final  String? notes;

/// Create a copy of CreateOrderResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderResponseDataCopyWith<_CreateOrderResponseData> get copyWith => __$CreateOrderResponseDataCopyWithImpl<_CreateOrderResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderResponseData&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderNumber,shippingAddress,phoneNumber,paymentMethod,notes);

@override
String toString() {
  return 'CreateOrderResponseData(orderNumber: $orderNumber, shippingAddress: $shippingAddress, phoneNumber: $phoneNumber, paymentMethod: $paymentMethod, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderResponseDataCopyWith<$Res> implements $CreateOrderResponseDataCopyWith<$Res> {
  factory _$CreateOrderResponseDataCopyWith(_CreateOrderResponseData value, $Res Function(_CreateOrderResponseData) _then) = __$CreateOrderResponseDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order_number') String orderNumber,@JsonKey(name: 'shipping_address') String shippingAddress,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class __$CreateOrderResponseDataCopyWithImpl<$Res>
    implements _$CreateOrderResponseDataCopyWith<$Res> {
  __$CreateOrderResponseDataCopyWithImpl(this._self, this._then);

  final _CreateOrderResponseData _self;
  final $Res Function(_CreateOrderResponseData) _then;

/// Create a copy of CreateOrderResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNumber = null,Object? shippingAddress = null,Object? phoneNumber = null,Object? paymentMethod = null,Object? notes = freezed,}) {
  return _then(_CreateOrderResponseData(
orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
