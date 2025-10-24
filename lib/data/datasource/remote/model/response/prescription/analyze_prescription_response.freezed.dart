// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analyze_prescription_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyzePrescriptionResponse {

@JsonKey(name: 'prescription_id') int get prescriptionId;@JsonKey(name: 'extracted_text') String get extractedText;@JsonKey(name: 'matched_medicines') List<MatchedMedicineResponse>? get matchedMedicines;@JsonKey(name: 'unmatched_medicines') List<UnmatchedMedicineResponse>? get unmatchedMedicines;@JsonKey(name: 'error') String? get error;@JsonKey(name: 'details') String? get details;@JsonKey(name: 'confident') int? get confident;
/// Create a copy of AnalyzePrescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyzePrescriptionResponseCopyWith<AnalyzePrescriptionResponse> get copyWith => _$AnalyzePrescriptionResponseCopyWithImpl<AnalyzePrescriptionResponse>(this as AnalyzePrescriptionResponse, _$identity);

  /// Serializes this AnalyzePrescriptionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyzePrescriptionResponse&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.extractedText, extractedText) || other.extractedText == extractedText)&&const DeepCollectionEquality().equals(other.matchedMedicines, matchedMedicines)&&const DeepCollectionEquality().equals(other.unmatchedMedicines, unmatchedMedicines)&&(identical(other.error, error) || other.error == error)&&(identical(other.details, details) || other.details == details)&&(identical(other.confident, confident) || other.confident == confident));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prescriptionId,extractedText,const DeepCollectionEquality().hash(matchedMedicines),const DeepCollectionEquality().hash(unmatchedMedicines),error,details,confident);

@override
String toString() {
  return 'AnalyzePrescriptionResponse(prescriptionId: $prescriptionId, extractedText: $extractedText, matchedMedicines: $matchedMedicines, unmatchedMedicines: $unmatchedMedicines, error: $error, details: $details, confident: $confident)';
}


}

/// @nodoc
abstract mixin class $AnalyzePrescriptionResponseCopyWith<$Res>  {
  factory $AnalyzePrescriptionResponseCopyWith(AnalyzePrescriptionResponse value, $Res Function(AnalyzePrescriptionResponse) _then) = _$AnalyzePrescriptionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'prescription_id') int prescriptionId,@JsonKey(name: 'extracted_text') String extractedText,@JsonKey(name: 'matched_medicines') List<MatchedMedicineResponse>? matchedMedicines,@JsonKey(name: 'unmatched_medicines') List<UnmatchedMedicineResponse>? unmatchedMedicines,@JsonKey(name: 'error') String? error,@JsonKey(name: 'details') String? details,@JsonKey(name: 'confident') int? confident
});




}
/// @nodoc
class _$AnalyzePrescriptionResponseCopyWithImpl<$Res>
    implements $AnalyzePrescriptionResponseCopyWith<$Res> {
  _$AnalyzePrescriptionResponseCopyWithImpl(this._self, this._then);

  final AnalyzePrescriptionResponse _self;
  final $Res Function(AnalyzePrescriptionResponse) _then;

/// Create a copy of AnalyzePrescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prescriptionId = null,Object? extractedText = null,Object? matchedMedicines = freezed,Object? unmatchedMedicines = freezed,Object? error = freezed,Object? details = freezed,Object? confident = freezed,}) {
  return _then(_self.copyWith(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,extractedText: null == extractedText ? _self.extractedText : extractedText // ignore: cast_nullable_to_non_nullable
as String,matchedMedicines: freezed == matchedMedicines ? _self.matchedMedicines : matchedMedicines // ignore: cast_nullable_to_non_nullable
as List<MatchedMedicineResponse>?,unmatchedMedicines: freezed == unmatchedMedicines ? _self.unmatchedMedicines : unmatchedMedicines // ignore: cast_nullable_to_non_nullable
as List<UnmatchedMedicineResponse>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,confident: freezed == confident ? _self.confident : confident // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyzePrescriptionResponse].
extension AnalyzePrescriptionResponsePatterns on AnalyzePrescriptionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyzePrescriptionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyzePrescriptionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyzePrescriptionResponse value)  $default,){
final _that = this;
switch (_that) {
case _AnalyzePrescriptionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyzePrescriptionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyzePrescriptionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'prescription_id')  int prescriptionId, @JsonKey(name: 'extracted_text')  String extractedText, @JsonKey(name: 'matched_medicines')  List<MatchedMedicineResponse>? matchedMedicines, @JsonKey(name: 'unmatched_medicines')  List<UnmatchedMedicineResponse>? unmatchedMedicines, @JsonKey(name: 'error')  String? error, @JsonKey(name: 'details')  String? details, @JsonKey(name: 'confident')  int? confident)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyzePrescriptionResponse() when $default != null:
return $default(_that.prescriptionId,_that.extractedText,_that.matchedMedicines,_that.unmatchedMedicines,_that.error,_that.details,_that.confident);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'prescription_id')  int prescriptionId, @JsonKey(name: 'extracted_text')  String extractedText, @JsonKey(name: 'matched_medicines')  List<MatchedMedicineResponse>? matchedMedicines, @JsonKey(name: 'unmatched_medicines')  List<UnmatchedMedicineResponse>? unmatchedMedicines, @JsonKey(name: 'error')  String? error, @JsonKey(name: 'details')  String? details, @JsonKey(name: 'confident')  int? confident)  $default,) {final _that = this;
switch (_that) {
case _AnalyzePrescriptionResponse():
return $default(_that.prescriptionId,_that.extractedText,_that.matchedMedicines,_that.unmatchedMedicines,_that.error,_that.details,_that.confident);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'prescription_id')  int prescriptionId, @JsonKey(name: 'extracted_text')  String extractedText, @JsonKey(name: 'matched_medicines')  List<MatchedMedicineResponse>? matchedMedicines, @JsonKey(name: 'unmatched_medicines')  List<UnmatchedMedicineResponse>? unmatchedMedicines, @JsonKey(name: 'error')  String? error, @JsonKey(name: 'details')  String? details, @JsonKey(name: 'confident')  int? confident)?  $default,) {final _that = this;
switch (_that) {
case _AnalyzePrescriptionResponse() when $default != null:
return $default(_that.prescriptionId,_that.extractedText,_that.matchedMedicines,_that.unmatchedMedicines,_that.error,_that.details,_that.confident);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyzePrescriptionResponse implements AnalyzePrescriptionResponse {
  const _AnalyzePrescriptionResponse({@JsonKey(name: 'prescription_id') required this.prescriptionId, @JsonKey(name: 'extracted_text') required this.extractedText, @JsonKey(name: 'matched_medicines') final  List<MatchedMedicineResponse>? matchedMedicines, @JsonKey(name: 'unmatched_medicines') final  List<UnmatchedMedicineResponse>? unmatchedMedicines, @JsonKey(name: 'error') this.error, @JsonKey(name: 'details') this.details, @JsonKey(name: 'confident') this.confident}): _matchedMedicines = matchedMedicines,_unmatchedMedicines = unmatchedMedicines;
  factory _AnalyzePrescriptionResponse.fromJson(Map<String, dynamic> json) => _$AnalyzePrescriptionResponseFromJson(json);

@override@JsonKey(name: 'prescription_id') final  int prescriptionId;
@override@JsonKey(name: 'extracted_text') final  String extractedText;
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

@override@JsonKey(name: 'error') final  String? error;
@override@JsonKey(name: 'details') final  String? details;
@override@JsonKey(name: 'confident') final  int? confident;

/// Create a copy of AnalyzePrescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyzePrescriptionResponseCopyWith<_AnalyzePrescriptionResponse> get copyWith => __$AnalyzePrescriptionResponseCopyWithImpl<_AnalyzePrescriptionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyzePrescriptionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyzePrescriptionResponse&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.extractedText, extractedText) || other.extractedText == extractedText)&&const DeepCollectionEquality().equals(other._matchedMedicines, _matchedMedicines)&&const DeepCollectionEquality().equals(other._unmatchedMedicines, _unmatchedMedicines)&&(identical(other.error, error) || other.error == error)&&(identical(other.details, details) || other.details == details)&&(identical(other.confident, confident) || other.confident == confident));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prescriptionId,extractedText,const DeepCollectionEquality().hash(_matchedMedicines),const DeepCollectionEquality().hash(_unmatchedMedicines),error,details,confident);

@override
String toString() {
  return 'AnalyzePrescriptionResponse(prescriptionId: $prescriptionId, extractedText: $extractedText, matchedMedicines: $matchedMedicines, unmatchedMedicines: $unmatchedMedicines, error: $error, details: $details, confident: $confident)';
}


}

/// @nodoc
abstract mixin class _$AnalyzePrescriptionResponseCopyWith<$Res> implements $AnalyzePrescriptionResponseCopyWith<$Res> {
  factory _$AnalyzePrescriptionResponseCopyWith(_AnalyzePrescriptionResponse value, $Res Function(_AnalyzePrescriptionResponse) _then) = __$AnalyzePrescriptionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'prescription_id') int prescriptionId,@JsonKey(name: 'extracted_text') String extractedText,@JsonKey(name: 'matched_medicines') List<MatchedMedicineResponse>? matchedMedicines,@JsonKey(name: 'unmatched_medicines') List<UnmatchedMedicineResponse>? unmatchedMedicines,@JsonKey(name: 'error') String? error,@JsonKey(name: 'details') String? details,@JsonKey(name: 'confident') int? confident
});




}
/// @nodoc
class __$AnalyzePrescriptionResponseCopyWithImpl<$Res>
    implements _$AnalyzePrescriptionResponseCopyWith<$Res> {
  __$AnalyzePrescriptionResponseCopyWithImpl(this._self, this._then);

  final _AnalyzePrescriptionResponse _self;
  final $Res Function(_AnalyzePrescriptionResponse) _then;

/// Create a copy of AnalyzePrescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prescriptionId = null,Object? extractedText = null,Object? matchedMedicines = freezed,Object? unmatchedMedicines = freezed,Object? error = freezed,Object? details = freezed,Object? confident = freezed,}) {
  return _then(_AnalyzePrescriptionResponse(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,extractedText: null == extractedText ? _self.extractedText : extractedText // ignore: cast_nullable_to_non_nullable
as String,matchedMedicines: freezed == matchedMedicines ? _self._matchedMedicines : matchedMedicines // ignore: cast_nullable_to_non_nullable
as List<MatchedMedicineResponse>?,unmatchedMedicines: freezed == unmatchedMedicines ? _self._unmatchedMedicines : unmatchedMedicines // ignore: cast_nullable_to_non_nullable
as List<UnmatchedMedicineResponse>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,confident: freezed == confident ? _self.confident : confident // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
