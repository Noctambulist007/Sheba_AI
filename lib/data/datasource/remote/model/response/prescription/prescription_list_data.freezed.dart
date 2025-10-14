// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_list_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionListData {

@JsonKey(name: 'count') int get count;@JsonKey(name: 'next') String? get next;@JsonKey(name: 'previous') String? get previous;@JsonKey(name: 'results') List<PrescriptionResponseData> get results;
/// Create a copy of PrescriptionListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionListDataCopyWith<PrescriptionListData> get copyWith => _$PrescriptionListDataCopyWithImpl<PrescriptionListData>(this as PrescriptionListData, _$identity);

  /// Serializes this PrescriptionListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionListData&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PrescriptionListData(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PrescriptionListDataCopyWith<$Res>  {
  factory $PrescriptionListDataCopyWith(PrescriptionListData value, $Res Function(PrescriptionListData) _then) = _$PrescriptionListDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'count') int count,@JsonKey(name: 'next') String? next,@JsonKey(name: 'previous') String? previous,@JsonKey(name: 'results') List<PrescriptionResponseData> results
});




}
/// @nodoc
class _$PrescriptionListDataCopyWithImpl<$Res>
    implements $PrescriptionListDataCopyWith<$Res> {
  _$PrescriptionListDataCopyWithImpl(this._self, this._then);

  final PrescriptionListData _self;
  final $Res Function(PrescriptionListData) _then;

/// Create a copy of PrescriptionListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PrescriptionResponseData>,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionListData].
extension PrescriptionListDataPatterns on PrescriptionListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionListData value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionListData value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<PrescriptionResponseData> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionListData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<PrescriptionResponseData> results)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionListData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'count')  int count, @JsonKey(name: 'next')  String? next, @JsonKey(name: 'previous')  String? previous, @JsonKey(name: 'results')  List<PrescriptionResponseData> results)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionListData() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionListData implements PrescriptionListData {
  const _PrescriptionListData({@JsonKey(name: 'count') required this.count, @JsonKey(name: 'next') this.next, @JsonKey(name: 'previous') this.previous, @JsonKey(name: 'results') required final  List<PrescriptionResponseData> results}): _results = results;
  factory _PrescriptionListData.fromJson(Map<String, dynamic> json) => _$PrescriptionListDataFromJson(json);

@override@JsonKey(name: 'count') final  int count;
@override@JsonKey(name: 'next') final  String? next;
@override@JsonKey(name: 'previous') final  String? previous;
 final  List<PrescriptionResponseData> _results;
@override@JsonKey(name: 'results') List<PrescriptionResponseData> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PrescriptionListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionListDataCopyWith<_PrescriptionListData> get copyWith => __$PrescriptionListDataCopyWithImpl<_PrescriptionListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionListData&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PrescriptionListData(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionListDataCopyWith<$Res> implements $PrescriptionListDataCopyWith<$Res> {
  factory _$PrescriptionListDataCopyWith(_PrescriptionListData value, $Res Function(_PrescriptionListData) _then) = __$PrescriptionListDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'count') int count,@JsonKey(name: 'next') String? next,@JsonKey(name: 'previous') String? previous,@JsonKey(name: 'results') List<PrescriptionResponseData> results
});




}
/// @nodoc
class __$PrescriptionListDataCopyWithImpl<$Res>
    implements _$PrescriptionListDataCopyWith<$Res> {
  __$PrescriptionListDataCopyWithImpl(this._self, this._then);

  final _PrescriptionListData _self;
  final $Res Function(_PrescriptionListData) _then;

/// Create a copy of PrescriptionListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PrescriptionListData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PrescriptionResponseData>,
  ));
}


}

// dart format on
