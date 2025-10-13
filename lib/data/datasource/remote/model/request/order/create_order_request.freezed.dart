// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOrderRequest {

@JsonKey(name: 'shipping_address') String get shippingAddress;@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'notes') String? get notes;@JsonKey(name: 'items') List<OrderItemRequest> get items;
/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderRequestCopyWith<CreateOrderRequest> get copyWith => _$CreateOrderRequestCopyWithImpl<CreateOrderRequest>(this as CreateOrderRequest, _$identity);

  /// Serializes this CreateOrderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderRequest&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shippingAddress,phoneNumber,paymentMethod,notes,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CreateOrderRequest(shippingAddress: $shippingAddress, phoneNumber: $phoneNumber, paymentMethod: $paymentMethod, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class $CreateOrderRequestCopyWith<$Res>  {
  factory $CreateOrderRequestCopyWith(CreateOrderRequest value, $Res Function(CreateOrderRequest) _then) = _$CreateOrderRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shipping_address') String shippingAddress,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'notes') String? notes,@JsonKey(name: 'items') List<OrderItemRequest> items
});




}
/// @nodoc
class _$CreateOrderRequestCopyWithImpl<$Res>
    implements $CreateOrderRequestCopyWith<$Res> {
  _$CreateOrderRequestCopyWithImpl(this._self, this._then);

  final CreateOrderRequest _self;
  final $Res Function(CreateOrderRequest) _then;

/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shippingAddress = null,Object? phoneNumber = null,Object? paymentMethod = null,Object? notes = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderRequest].
extension CreateOrderRequestPatterns on CreateOrderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes, @JsonKey(name: 'items')  List<OrderItemRequest> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
return $default(_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes, @JsonKey(name: 'items')  List<OrderItemRequest> items)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderRequest():
return $default(_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'shipping_address')  String shippingAddress, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'notes')  String? notes, @JsonKey(name: 'items')  List<OrderItemRequest> items)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
return $default(_that.shippingAddress,_that.phoneNumber,_that.paymentMethod,_that.notes,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderRequest implements CreateOrderRequest {
  const _CreateOrderRequest({@JsonKey(name: 'shipping_address') required this.shippingAddress, @JsonKey(name: 'phone_number') required this.phoneNumber, @JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'notes') this.notes, @JsonKey(name: 'items') required final  List<OrderItemRequest> items}): _items = items;
  factory _CreateOrderRequest.fromJson(Map<String, dynamic> json) => _$CreateOrderRequestFromJson(json);

@override@JsonKey(name: 'shipping_address') final  String shippingAddress;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'notes') final  String? notes;
 final  List<OrderItemRequest> _items;
@override@JsonKey(name: 'items') List<OrderItemRequest> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderRequestCopyWith<_CreateOrderRequest> get copyWith => __$CreateOrderRequestCopyWithImpl<_CreateOrderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderRequest&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shippingAddress,phoneNumber,paymentMethod,notes,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CreateOrderRequest(shippingAddress: $shippingAddress, phoneNumber: $phoneNumber, paymentMethod: $paymentMethod, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderRequestCopyWith<$Res> implements $CreateOrderRequestCopyWith<$Res> {
  factory _$CreateOrderRequestCopyWith(_CreateOrderRequest value, $Res Function(_CreateOrderRequest) _then) = __$CreateOrderRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shipping_address') String shippingAddress,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'notes') String? notes,@JsonKey(name: 'items') List<OrderItemRequest> items
});




}
/// @nodoc
class __$CreateOrderRequestCopyWithImpl<$Res>
    implements _$CreateOrderRequestCopyWith<$Res> {
  __$CreateOrderRequestCopyWithImpl(this._self, this._then);

  final _CreateOrderRequest _self;
  final $Res Function(_CreateOrderRequest) _then;

/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shippingAddress = null,Object? phoneNumber = null,Object? paymentMethod = null,Object? notes = freezed,Object? items = null,}) {
  return _then(_CreateOrderRequest(
shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemRequest>,
  ));
}


}

// dart format on
