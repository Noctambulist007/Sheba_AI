// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionResponseData {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'image') String get image;@JsonKey(name: 'status') String get status;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'matched_medicines') List<MatchedMedicineResponse>? get matchedMedicines;@JsonKey(name: 'unmatched_medicines') List<UnmatchedMedicineResponse>? get unmatchedMedicines;
/// Create a copy of PrescriptionResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionResponseDataCopyWith<PrescriptionResponseData> get copyWith => _$PrescriptionResponseDataCopyWithImpl<PrescriptionResponseData>(this as PrescriptionResponseData, _$identity);

  /// Serializes this PrescriptionResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.matchedMedicines, matchedMedicines)&&const DeepCollectionEquality().equals(other.unmatchedMedicines, unmatchedMedicines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,status,createdAt,const DeepCollectionEquality().hash(matchedMedicines),const DeepCollectionEquality().hash(unmatchedMedicines));

@override
String toString() {
  return 'PrescriptionResponseData(id: $id, image: $image, status: $status, createdAt: $createdAt, matchedMedicines: $matchedMedicines, unmatchedMedicines: $unmatchedMedicines)';
}


}

/// @nodoc
abstract mixin class $PrescriptionResponseDataCopyWith<$Res>  {
  factory $PrescriptionResponseDataCopyWith(PrescriptionResponseData value, $Res Function(PrescriptionResponseData) _then) = _$PrescriptionResponseDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'image') String image,@JsonKey(name: 'status') String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'matched_medicines') List<MatchedMedicineResponse>? matchedMedicines,@JsonKey(name: 'unmatched_medicines') List<UnmatchedMedicineResponse>? unmatchedMedicines
});




}
/// @nodoc
class _$PrescriptionResponseDataCopyWithImpl<$Res>
    implements $PrescriptionResponseDataCopyWith<$Res> {
  _$PrescriptionResponseDataCopyWithImpl(this._self, this._then);

  final PrescriptionResponseData _self;
  final $Res Function(PrescriptionResponseData) _then;

/// Create a copy of PrescriptionResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? image = null,Object? status = null,Object? createdAt = null,Object? matchedMedicines = freezed,Object? unmatchedMedicines = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,matchedMedicines: freezed == matchedMedicines ? _self.matchedMedicines : matchedMedicines // ignore: cast_nullable_to_non_nullable
as List<MatchedMedicineResponse>?,unmatchedMedicines: freezed == unmatchedMedicines ? _self.unmatchedMedicines : unmatchedMedicines // ignore: cast_nullable_to_non_nullable
as List<UnmatchedMedicineResponse>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionResponseData].
extension PrescriptionResponseDataPatterns on PrescriptionResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionResponseData value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'image')  String image, @JsonKey(name: 'status')  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'matched_medicines')  List<MatchedMedicineResponse>? matchedMedicines, @JsonKey(name: 'unmatched_medicines')  List<UnmatchedMedicineResponse>? unmatchedMedicines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionResponseData() when $default != null:
return $default(_that.id,_that.image,_that.status,_that.createdAt,_that.matchedMedicines,_that.unmatchedMedicines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'image')  String image, @JsonKey(name: 'status')  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'matched_medicines')  List<MatchedMedicineResponse>? matchedMedicines, @JsonKey(name: 'unmatched_medicines')  List<UnmatchedMedicineResponse>? unmatchedMedicines)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionResponseData():
return $default(_that.id,_that.image,_that.status,_that.createdAt,_that.matchedMedicines,_that.unmatchedMedicines);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'image')  String image, @JsonKey(name: 'status')  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'matched_medicines')  List<MatchedMedicineResponse>? matchedMedicines, @JsonKey(name: 'unmatched_medicines')  List<UnmatchedMedicineResponse>? unmatchedMedicines)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionResponseData() when $default != null:
return $default(_that.id,_that.image,_that.status,_that.createdAt,_that.matchedMedicines,_that.unmatchedMedicines);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionResponseData implements PrescriptionResponseData {
  const _PrescriptionResponseData({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'image') required this.image, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'matched_medicines') final  List<MatchedMedicineResponse>? matchedMedicines, @JsonKey(name: 'unmatched_medicines') final  List<UnmatchedMedicineResponse>? unmatchedMedicines}): _matchedMedicines = matchedMedicines,_unmatchedMedicines = unmatchedMedicines;
  factory _PrescriptionResponseData.fromJson(Map<String, dynamic> json) => _$PrescriptionResponseDataFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'image') final  String image;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'created_at') final  String createdAt;
 final  List<MatchedMedicineResponse>? _matchedMedicines;
@override@JsonKey(name: 'matched_medicines') List<MatchedMedicineResponse>? get matchedMedicines {
  final value = _matchedMedicines;
  if (value == null) return null;
  if (_matchedMedicines is EqualUnmodifiableListView) return _matchedMedicines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<UnmatchedMedicineResponse>? _unmatchedMedicines;
@override@JsonKey(name: 'unmatched_medicines') List<UnmatchedMedicineResponse>? get unmatchedMedicines {
  final value = _unmatchedMedicines;
  if (value == null) return null;
  if (_unmatchedMedicines is EqualUnmodifiableListView) return _unmatchedMedicines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PrescriptionResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionResponseDataCopyWith<_PrescriptionResponseData> get copyWith => __$PrescriptionResponseDataCopyWithImpl<_PrescriptionResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._matchedMedicines, _matchedMedicines)&&const DeepCollectionEquality().equals(other._unmatchedMedicines, _unmatchedMedicines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,status,createdAt,const DeepCollectionEquality().hash(_matchedMedicines),const DeepCollectionEquality().hash(_unmatchedMedicines));

@override
String toString() {
  return 'PrescriptionResponseData(id: $id, image: $image, status: $status, createdAt: $createdAt, matchedMedicines: $matchedMedicines, unmatchedMedicines: $unmatchedMedicines)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionResponseDataCopyWith<$Res> implements $PrescriptionResponseDataCopyWith<$Res> {
  factory _$PrescriptionResponseDataCopyWith(_PrescriptionResponseData value, $Res Function(_PrescriptionResponseData) _then) = __$PrescriptionResponseDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'image') String image,@JsonKey(name: 'status') String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'matched_medicines') List<MatchedMedicineResponse>? matchedMedicines,@JsonKey(name: 'unmatched_medicines') List<UnmatchedMedicineResponse>? unmatchedMedicines
});




}
/// @nodoc
class __$PrescriptionResponseDataCopyWithImpl<$Res>
    implements _$PrescriptionResponseDataCopyWith<$Res> {
  __$PrescriptionResponseDataCopyWithImpl(this._self, this._then);

  final _PrescriptionResponseData _self;
  final $Res Function(_PrescriptionResponseData) _then;

/// Create a copy of PrescriptionResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? image = null,Object? status = null,Object? createdAt = null,Object? matchedMedicines = freezed,Object? unmatchedMedicines = freezed,}) {
  return _then(_PrescriptionResponseData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,matchedMedicines: freezed == matchedMedicines ? _self._matchedMedicines : matchedMedicines // ignore: cast_nullable_to_non_nullable
as List<MatchedMedicineResponse>?,unmatchedMedicines: freezed == unmatchedMedicines ? _self._unmatchedMedicines : unmatchedMedicines // ignore: cast_nullable_to_non_nullable
as List<UnmatchedMedicineResponse>?,
  ));
}


}

// dart format on
