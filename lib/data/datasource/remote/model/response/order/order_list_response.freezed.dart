// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderListResponse {

@JsonKey(name: 'success') bool get success;@JsonKey(name: 'data') OrderListData get data;
/// Create a copy of OrderListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderListResponseCopyWith<OrderListResponse> get copyWith => _$OrderListResponseCopyWithImpl<OrderListResponse>(this as OrderListResponse, _$identity);

  /// Serializes this OrderListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'OrderListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $OrderListResponseCopyWith<$Res>  {
  factory $OrderListResponseCopyWith(OrderListResponse value, $Res Function(OrderListResponse) _then) = _$OrderListResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'data') OrderListData data
});


$OrderListDataCopyWith<$Res> get data;

}
/// @nodoc
class _$OrderListResponseCopyWithImpl<$Res>
    implements $OrderListResponseCopyWith<$Res> {
  _$OrderListResponseCopyWithImpl(this._self, this._then);

  final OrderListResponse _self;
  final $Res Function(OrderListResponse) _then;

/// Create a copy of OrderListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderListData,
  ));
}
/// Create a copy of OrderListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderListDataCopyWith<$Res> get data {
  
  return $OrderListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderListResponse].
extension OrderListResponsePatterns on OrderListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderListResponse value)  $default,){
final _that = this;
switch (_that) {
case _OrderListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OrderListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'data')  OrderListData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderListResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'data')  OrderListData data)  $default,) {final _that = this;
switch (_that) {
case _OrderListResponse():
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'data')  OrderListData data)?  $default,) {final _that = this;
switch (_that) {
case _OrderListResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderListResponse implements OrderListResponse {
  const _OrderListResponse({@JsonKey(name: 'success') required this.success, @JsonKey(name: 'data') required this.data});
  factory _OrderListResponse.fromJson(Map<String, dynamic> json) => _$OrderListResponseFromJson(json);

@override@JsonKey(name: 'success') final  bool success;
@override@JsonKey(name: 'data') final  OrderListData data;

/// Create a copy of OrderListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderListResponseCopyWith<_OrderListResponse> get copyWith => __$OrderListResponseCopyWithImpl<_OrderListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'OrderListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OrderListResponseCopyWith<$Res> implements $OrderListResponseCopyWith<$Res> {
  factory _$OrderListResponseCopyWith(_OrderListResponse value, $Res Function(_OrderListResponse) _then) = __$OrderListResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'data') OrderListData data
});


@override $OrderListDataCopyWith<$Res> get data;

}
/// @nodoc
class __$OrderListResponseCopyWithImpl<$Res>
    implements _$OrderListResponseCopyWith<$Res> {
  __$OrderListResponseCopyWithImpl(this._self, this._then);

  final _OrderListResponse _self;
  final $Res Function(_OrderListResponse) _then;

/// Create a copy of OrderListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_OrderListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderListData,
  ));
}

/// Create a copy of OrderListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderListDataCopyWith<$Res> get data {
  
  return $OrderListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
