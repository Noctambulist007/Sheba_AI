// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderListData {

@JsonKey(name: 'count') int get count;@JsonKey(name: 'next') String? get next;@JsonKey(name: 'previous') String? get previous;@JsonKey(name: 'results') List<OrderResponseData> get results;
/// Create a copy of OrderListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderListDataCopyWith<OrderListData> get copyWith => _$OrderListDataCopyWithImpl<OrderListData>(this as OrderListData, _$identity);

  /// Serializes this OrderListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListData&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'OrderListData(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $OrderListDataCopyWith<$Res>  {
  factory $OrderListDataCopyWith(OrderListData value, $Res Function(OrderListData) _then) = _$OrderListDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'count') int count,@JsonKey(name: 'next') String? next,@JsonKey(name: 'previous') String? previous,@JsonKey(name: 'results') List<OrderResponseData> results
});




}
/// @nodoc
class _$OrderListDataCopyWithImpl<$Res>
    implements $OrderListDataCopyWith<$Res> {
  _$OrderListDataCopyWithImpl(this._self, this._then);

  final OrderListData _self;
  final $Res Function(OrderListData) _then;

/// Create a copy of OrderListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<OrderResponseData>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderListData].
extension OrderListDataPatterns on OrderListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderListData value)  $default,){
final _that = this;
switch (_that) {
case _OrderListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderListData value)?  $default,){
final _that = this;
switch (_that) {
case _OrderListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<OrderResponseData> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderListData() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<OrderResponseData> results)  $default,) {final _that = this;
switch (_that) {
case _OrderListData():
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<OrderResponseData> results)?  $default,) {final _that = this;
switch (_that) {
case _OrderListData() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderListData implements OrderListData {
  const _OrderListData({@JsonKey(name: 'count') required this.count, @JsonKey(name: 'next') this.next, @JsonKey(name: 'previous') this.previous, @JsonKey(name: 'results') required final  List<OrderResponseData> results}): _results = results;
  factory _OrderListData.fromJson(Map<String, dynamic> json) => _$OrderListDataFromJson(json);

@override@JsonKey(name: 'count') final  int count;
@override@JsonKey(name: 'next') final  String? next;
@override@JsonKey(name: 'previous') final  String? previous;
 final  List<OrderResponseData> _results;
@override@JsonKey(name: 'results') List<OrderResponseData> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of OrderListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderListDataCopyWith<_OrderListData> get copyWith => __$OrderListDataCopyWithImpl<_OrderListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderListData&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'OrderListData(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$OrderListDataCopyWith<$Res> implements $OrderListDataCopyWith<$Res> {
  factory _$OrderListDataCopyWith(_OrderListData value, $Res Function(_OrderListData) _then) = __$OrderListDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'count') int count,@JsonKey(name: 'next') String? next,@JsonKey(name: 'previous') String? previous,@JsonKey(name: 'results') List<OrderResponseData> results
});




}
/// @nodoc
class __$OrderListDataCopyWithImpl<$Res>
    implements _$OrderListDataCopyWith<$Res> {
  __$OrderListDataCopyWithImpl(this._self, this._then);

  final _OrderListData _self;
  final $Res Function(_OrderListData) _then;

/// Create a copy of OrderListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_OrderListData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<OrderResponseData>,
  ));
}


}

// dart format on
