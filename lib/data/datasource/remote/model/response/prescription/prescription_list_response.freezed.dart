// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionListResponse {

@JsonKey(name: 'success') bool get success;@JsonKey(name: 'data') PrescriptionListData get data;
/// Create a copy of PrescriptionListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionListResponseCopyWith<PrescriptionListResponse> get copyWith => _$PrescriptionListResponseCopyWithImpl<PrescriptionListResponse>(this as PrescriptionListResponse, _$identity);

  /// Serializes this PrescriptionListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'PrescriptionListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $PrescriptionListResponseCopyWith<$Res>  {
  factory $PrescriptionListResponseCopyWith(PrescriptionListResponse value, $Res Function(PrescriptionListResponse) _then) = _$PrescriptionListResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'data') PrescriptionListData data
});


$PrescriptionListDataCopyWith<$Res> get data;

}
/// @nodoc
class _$PrescriptionListResponseCopyWithImpl<$Res>
    implements $PrescriptionListResponseCopyWith<$Res> {
  _$PrescriptionListResponseCopyWithImpl(this._self, this._then);

  final PrescriptionListResponse _self;
  final $Res Function(PrescriptionListResponse) _then;

/// Create a copy of PrescriptionListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PrescriptionListData,
  ));
}
/// Create a copy of PrescriptionListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrescriptionListDataCopyWith<$Res> get data {
  
  return $PrescriptionListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PrescriptionListResponse].
extension PrescriptionListResponsePatterns on PrescriptionListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionListResponse value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'data')  PrescriptionListData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'data')  PrescriptionListData data)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'success')  bool success, @JsonKey(name: 'data')  PrescriptionListData data)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionListResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionListResponse implements PrescriptionListResponse {
  const _PrescriptionListResponse({@JsonKey(name: 'success') required this.success, @JsonKey(name: 'data') required this.data});
  factory _PrescriptionListResponse.fromJson(Map<String, dynamic> json) => _$PrescriptionListResponseFromJson(json);

@override@JsonKey(name: 'success') final  bool success;
@override@JsonKey(name: 'data') final  PrescriptionListData data;

/// Create a copy of PrescriptionListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionListResponseCopyWith<_PrescriptionListResponse> get copyWith => __$PrescriptionListResponseCopyWithImpl<_PrescriptionListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'PrescriptionListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionListResponseCopyWith<$Res> implements $PrescriptionListResponseCopyWith<$Res> {
  factory _$PrescriptionListResponseCopyWith(_PrescriptionListResponse value, $Res Function(_PrescriptionListResponse) _then) = __$PrescriptionListResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'success') bool success,@JsonKey(name: 'data') PrescriptionListData data
});


@override $PrescriptionListDataCopyWith<$Res> get data;

}
/// @nodoc
class __$PrescriptionListResponseCopyWithImpl<$Res>
    implements _$PrescriptionListResponseCopyWith<$Res> {
  __$PrescriptionListResponseCopyWithImpl(this._self, this._then);

  final _PrescriptionListResponse _self;
  final $Res Function(_PrescriptionListResponse) _then;

/// Create a copy of PrescriptionListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_PrescriptionListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PrescriptionListData,
  ));
}

/// Create a copy of PrescriptionListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrescriptionListDataCopyWith<$Res> get data {
  
  return $PrescriptionListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
