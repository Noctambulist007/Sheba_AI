// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderResponseData {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'order_number') String get orderNumber;@JsonKey(name: 'status') String get status;@JsonKey(name: 'status_display') String get statusDisplay;@JsonKey(name: 'total_price') String get totalPrice;@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'payment_method_display') String get paymentMethodDisplay;@JsonKey(name: 'payment_status') bool get paymentStatus;@JsonKey(name: 'item_count') int get itemCount;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of OrderResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderResponseDataCopyWith<OrderResponseData> get copyWith => _$OrderResponseDataCopyWithImpl<OrderResponseData>(this as OrderResponseData, _$identity);

  /// Serializes this OrderResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusDisplay, statusDisplay) || other.statusDisplay == statusDisplay)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentMethodDisplay, paymentMethodDisplay) || other.paymentMethodDisplay == paymentMethodDisplay)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,status,statusDisplay,totalPrice,paymentMethod,paymentMethodDisplay,paymentStatus,itemCount,createdAt);

@override
String toString() {
  return 'OrderResponseData(id: $id, orderNumber: $orderNumber, status: $status, statusDisplay: $statusDisplay, totalPrice: $totalPrice, paymentMethod: $paymentMethod, paymentMethodDisplay: $paymentMethodDisplay, paymentStatus: $paymentStatus, itemCount: $itemCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OrderResponseDataCopyWith<$Res>  {
  factory $OrderResponseDataCopyWith(OrderResponseData value, $Res Function(OrderResponseData) _then) = _$OrderResponseDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'order_number') String orderNumber,@JsonKey(name: 'status') String status,@JsonKey(name: 'status_display') String statusDisplay,@JsonKey(name: 'total_price') String totalPrice,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'payment_method_display') String paymentMethodDisplay,@JsonKey(name: 'payment_status') bool paymentStatus,@JsonKey(name: 'item_count') int itemCount,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$OrderResponseDataCopyWithImpl<$Res>
    implements $OrderResponseDataCopyWith<$Res> {
  _$OrderResponseDataCopyWithImpl(this._self, this._then);

  final OrderResponseData _self;
  final $Res Function(OrderResponseData) _then;

/// Create a copy of OrderResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? status = null,Object? statusDisplay = null,Object? totalPrice = null,Object? paymentMethod = null,Object? paymentMethodDisplay = null,Object? paymentStatus = null,Object? itemCount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusDisplay: null == statusDisplay ? _self.statusDisplay : statusDisplay // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethodDisplay: null == paymentMethodDisplay ? _self.paymentMethodDisplay : paymentMethodDisplay // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as bool,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderResponseData].
extension OrderResponseDataPatterns on OrderResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderResponseData value)  $default,){
final _that = this;
switch (_that) {
case _OrderResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _OrderResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'status')  String status, @JsonKey(name: 'status_display')  String statusDisplay, @JsonKey(name: 'total_price')  String totalPrice, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_method_display')  String paymentMethodDisplay, @JsonKey(name: 'payment_status')  bool paymentStatus, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderResponseData() when $default != null:
return $default(_that.id,_that.orderNumber,_that.status,_that.statusDisplay,_that.totalPrice,_that.paymentMethod,_that.paymentMethodDisplay,_that.paymentStatus,_that.itemCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'status')  String status, @JsonKey(name: 'status_display')  String statusDisplay, @JsonKey(name: 'total_price')  String totalPrice, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_method_display')  String paymentMethodDisplay, @JsonKey(name: 'payment_status')  bool paymentStatus, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _OrderResponseData():
return $default(_that.id,_that.orderNumber,_that.status,_that.statusDisplay,_that.totalPrice,_that.paymentMethod,_that.paymentMethodDisplay,_that.paymentStatus,_that.itemCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'order_number')  String orderNumber, @JsonKey(name: 'status')  String status, @JsonKey(name: 'status_display')  String statusDisplay, @JsonKey(name: 'total_price')  String totalPrice, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'payment_method_display')  String paymentMethodDisplay, @JsonKey(name: 'payment_status')  bool paymentStatus, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderResponseData() when $default != null:
return $default(_that.id,_that.orderNumber,_that.status,_that.statusDisplay,_that.totalPrice,_that.paymentMethod,_that.paymentMethodDisplay,_that.paymentStatus,_that.itemCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderResponseData implements OrderResponseData {
  const _OrderResponseData({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'order_number') required this.orderNumber, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'status_display') required this.statusDisplay, @JsonKey(name: 'total_price') required this.totalPrice, @JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'payment_method_display') required this.paymentMethodDisplay, @JsonKey(name: 'payment_status') required this.paymentStatus, @JsonKey(name: 'item_count') required this.itemCount, @JsonKey(name: 'created_at') required this.createdAt});
  factory _OrderResponseData.fromJson(Map<String, dynamic> json) => _$OrderResponseDataFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'order_number') final  String orderNumber;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'status_display') final  String statusDisplay;
@override@JsonKey(name: 'total_price') final  String totalPrice;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'payment_method_display') final  String paymentMethodDisplay;
@override@JsonKey(name: 'payment_status') final  bool paymentStatus;
@override@JsonKey(name: 'item_count') final  int itemCount;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of OrderResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderResponseDataCopyWith<_OrderResponseData> get copyWith => __$OrderResponseDataCopyWithImpl<_OrderResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusDisplay, statusDisplay) || other.statusDisplay == statusDisplay)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paymentMethodDisplay, paymentMethodDisplay) || other.paymentMethodDisplay == paymentMethodDisplay)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,status,statusDisplay,totalPrice,paymentMethod,paymentMethodDisplay,paymentStatus,itemCount,createdAt);

@override
String toString() {
  return 'OrderResponseData(id: $id, orderNumber: $orderNumber, status: $status, statusDisplay: $statusDisplay, totalPrice: $totalPrice, paymentMethod: $paymentMethod, paymentMethodDisplay: $paymentMethodDisplay, paymentStatus: $paymentStatus, itemCount: $itemCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderResponseDataCopyWith<$Res> implements $OrderResponseDataCopyWith<$Res> {
  factory _$OrderResponseDataCopyWith(_OrderResponseData value, $Res Function(_OrderResponseData) _then) = __$OrderResponseDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'order_number') String orderNumber,@JsonKey(name: 'status') String status,@JsonKey(name: 'status_display') String statusDisplay,@JsonKey(name: 'total_price') String totalPrice,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'payment_method_display') String paymentMethodDisplay,@JsonKey(name: 'payment_status') bool paymentStatus,@JsonKey(name: 'item_count') int itemCount,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$OrderResponseDataCopyWithImpl<$Res>
    implements _$OrderResponseDataCopyWith<$Res> {
  __$OrderResponseDataCopyWithImpl(this._self, this._then);

  final _OrderResponseData _self;
  final $Res Function(_OrderResponseData) _then;

/// Create a copy of OrderResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? status = null,Object? statusDisplay = null,Object? totalPrice = null,Object? paymentMethod = null,Object? paymentMethodDisplay = null,Object? paymentStatus = null,Object? itemCount = null,Object? createdAt = null,}) {
  return _then(_OrderResponseData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusDisplay: null == statusDisplay ? _self.statusDisplay : statusDisplay // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethodDisplay: null == paymentMethodDisplay ? _self.paymentMethodDisplay : paymentMethodDisplay // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as bool,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
