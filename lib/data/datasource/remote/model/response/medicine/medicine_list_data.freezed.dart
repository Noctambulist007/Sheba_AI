// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_list_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicineListData {

@JsonKey(name: 'count') int get count;@JsonKey(name: 'next') String? get next;@JsonKey(name: 'previous') String? get previous;@JsonKey(name: 'results') List<MedicineResponseData> get results;
/// Create a copy of MedicineListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicineListDataCopyWith<MedicineListData> get copyWith => _$MedicineListDataCopyWithImpl<MedicineListData>(this as MedicineListData, _$identity);

  /// Serializes this MedicineListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicineListData&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'MedicineListData(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $MedicineListDataCopyWith<$Res>  {
  factory $MedicineListDataCopyWith(MedicineListData value, $Res Function(MedicineListData) _then) = _$MedicineListDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'count') int count,@JsonKey(name: 'next') String? next,@JsonKey(name: 'previous') String? previous,@JsonKey(name: 'results') List<MedicineResponseData> results
});




}
/// @nodoc
class _$MedicineListDataCopyWithImpl<$Res>
    implements $MedicineListDataCopyWith<$Res> {
  _$MedicineListDataCopyWithImpl(this._self, this._then);

  final MedicineListData _self;
  final $Res Function(MedicineListData) _then;

/// Create a copy of MedicineListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<MedicineResponseData>,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicineListData].
extension MedicineListDataPatterns on MedicineListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicineListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicineListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicineListData value)  $default,){
final _that = this;
switch (_that) {
case _MedicineListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicineListData value)?  $default,){
final _that = this;
switch (_that) {
case _MedicineListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<MedicineResponseData> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicineListData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<MedicineResponseData> results)  $default,) {final _that = this;
switch (_that) {
case _MedicineListData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<MedicineResponseData> results)?  $default,) {final _that = this;
switch (_that) {
case _MedicineListData() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicineListData implements MedicineListData {
  const _MedicineListData({@JsonKey(name: 'count') required this.count, @JsonKey(name: 'next') this.next, @JsonKey(name: 'previous') this.previous, @JsonKey(name: 'results') required final  List<MedicineResponseData> results}): _results = results;
  factory _MedicineListData.fromJson(Map<String, dynamic> json) => _$MedicineListDataFromJson(json);

@override@JsonKey(name: 'count') final  int count;
@override@JsonKey(name: 'next') final  String? next;
@override@JsonKey(name: 'previous') final  String? previous;
 final  List<MedicineResponseData> _results;
@override@JsonKey(name: 'results') List<MedicineResponseData> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of MedicineListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicineListDataCopyWith<_MedicineListData> get copyWith => __$MedicineListDataCopyWithImpl<_MedicineListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicineListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicineListData&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'MedicineListData(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$MedicineListDataCopyWith<$Res> implements $MedicineListDataCopyWith<$Res> {
  factory _$MedicineListDataCopyWith(_MedicineListData value, $Res Function(_MedicineListData) _then) = __$MedicineListDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'count') int count,@JsonKey(name: 'next') String? next,@JsonKey(name: 'previous') String? previous,@JsonKey(name: 'results') List<MedicineResponseData> results
});




}
/// @nodoc
class __$MedicineListDataCopyWithImpl<$Res>
    implements _$MedicineListDataCopyWith<$Res> {
  __$MedicineListDataCopyWithImpl(this._self, this._then);

  final _MedicineListData _self;
  final $Res Function(_MedicineListData) _then;

/// Create a copy of MedicineListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_MedicineListData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<MedicineResponseData>,
  ));
}


}

// dart format on
