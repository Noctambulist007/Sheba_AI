// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matched_medicine_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchedMedicineResponse {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'generic_name') String get genericName;@JsonKey(name: 'price') String get price;@JsonKey(name: 'extract_details') ExtractDetails? get extractDetails;
/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchedMedicineResponseCopyWith<MatchedMedicineResponse> get copyWith => _$MatchedMedicineResponseCopyWithImpl<MatchedMedicineResponse>(this as MatchedMedicineResponse, _$identity);

  /// Serializes this MatchedMedicineResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchedMedicineResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.price, price) || other.price == price)&&(identical(other.extractDetails, extractDetails) || other.extractDetails == extractDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,genericName,price,extractDetails);

@override
String toString() {
  return 'MatchedMedicineResponse(id: $id, name: $name, genericName: $genericName, price: $price, extractDetails: $extractDetails)';
}


}

/// @nodoc
abstract mixin class $MatchedMedicineResponseCopyWith<$Res>  {
  factory $MatchedMedicineResponseCopyWith(MatchedMedicineResponse value, $Res Function(MatchedMedicineResponse) _then) = _$MatchedMedicineResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'generic_name') String genericName,@JsonKey(name: 'price') String price,@JsonKey(name: 'extract_details') ExtractDetails? extractDetails
});


$ExtractDetailsCopyWith<$Res>? get extractDetails;

}
/// @nodoc
class _$MatchedMedicineResponseCopyWithImpl<$Res>
    implements $MatchedMedicineResponseCopyWith<$Res> {
  _$MatchedMedicineResponseCopyWithImpl(this._self, this._then);

  final MatchedMedicineResponse _self;
  final $Res Function(MatchedMedicineResponse) _then;

/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? genericName = null,Object? price = null,Object? extractDetails = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,genericName: null == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,extractDetails: freezed == extractDetails ? _self.extractDetails : extractDetails // ignore: cast_nullable_to_non_nullable
as ExtractDetails?,
  ));
}
/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtractDetailsCopyWith<$Res>? get extractDetails {
    if (_self.extractDetails == null) {
    return null;
  }

  return $ExtractDetailsCopyWith<$Res>(_self.extractDetails!, (value) {
    return _then(_self.copyWith(extractDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchedMedicineResponse].
extension MatchedMedicineResponsePatterns on MatchedMedicineResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchedMedicineResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchedMedicineResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchedMedicineResponse value)  $default,){
final _that = this;
switch (_that) {
case _MatchedMedicineResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchedMedicineResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MatchedMedicineResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'generic_name')  String genericName, @JsonKey(name: 'price')  String price, @JsonKey(name: 'extract_details')  ExtractDetails? extractDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchedMedicineResponse() when $default != null:
return $default(_that.id,_that.name,_that.genericName,_that.price,_that.extractDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'generic_name')  String genericName, @JsonKey(name: 'price')  String price, @JsonKey(name: 'extract_details')  ExtractDetails? extractDetails)  $default,) {final _that = this;
switch (_that) {
case _MatchedMedicineResponse():
return $default(_that.id,_that.name,_that.genericName,_that.price,_that.extractDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'generic_name')  String genericName, @JsonKey(name: 'price')  String price, @JsonKey(name: 'extract_details')  ExtractDetails? extractDetails)?  $default,) {final _that = this;
switch (_that) {
case _MatchedMedicineResponse() when $default != null:
return $default(_that.id,_that.name,_that.genericName,_that.price,_that.extractDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchedMedicineResponse implements MatchedMedicineResponse {
  const _MatchedMedicineResponse({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'generic_name') required this.genericName, @JsonKey(name: 'price') required this.price, @JsonKey(name: 'extract_details') this.extractDetails});
  factory _MatchedMedicineResponse.fromJson(Map<String, dynamic> json) => _$MatchedMedicineResponseFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'generic_name') final  String genericName;
@override@JsonKey(name: 'price') final  String price;
@override@JsonKey(name: 'extract_details') final  ExtractDetails? extractDetails;

/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchedMedicineResponseCopyWith<_MatchedMedicineResponse> get copyWith => __$MatchedMedicineResponseCopyWithImpl<_MatchedMedicineResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchedMedicineResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchedMedicineResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.price, price) || other.price == price)&&(identical(other.extractDetails, extractDetails) || other.extractDetails == extractDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,genericName,price,extractDetails);

@override
String toString() {
  return 'MatchedMedicineResponse(id: $id, name: $name, genericName: $genericName, price: $price, extractDetails: $extractDetails)';
}


}

/// @nodoc
abstract mixin class _$MatchedMedicineResponseCopyWith<$Res> implements $MatchedMedicineResponseCopyWith<$Res> {
  factory _$MatchedMedicineResponseCopyWith(_MatchedMedicineResponse value, $Res Function(_MatchedMedicineResponse) _then) = __$MatchedMedicineResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'generic_name') String genericName,@JsonKey(name: 'price') String price,@JsonKey(name: 'extract_details') ExtractDetails? extractDetails
});


@override $ExtractDetailsCopyWith<$Res>? get extractDetails;

}
/// @nodoc
class __$MatchedMedicineResponseCopyWithImpl<$Res>
    implements _$MatchedMedicineResponseCopyWith<$Res> {
  __$MatchedMedicineResponseCopyWithImpl(this._self, this._then);

  final _MatchedMedicineResponse _self;
  final $Res Function(_MatchedMedicineResponse) _then;

/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? genericName = null,Object? price = null,Object? extractDetails = freezed,}) {
  return _then(_MatchedMedicineResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,genericName: null == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,extractDetails: freezed == extractDetails ? _self.extractDetails : extractDetails // ignore: cast_nullable_to_non_nullable
as ExtractDetails?,
  ));
}

/// Create a copy of MatchedMedicineResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtractDetailsCopyWith<$Res>? get extractDetails {
    if (_self.extractDetails == null) {
    return null;
  }

  return $ExtractDetailsCopyWith<$Res>(_self.extractDetails!, (value) {
    return _then(_self.copyWith(extractDetails: value));
  });
}
}


/// @nodoc
mixin _$ExtractDetails {

@JsonKey(name: 'strength') String? get strength;@JsonKey(name: 'frequency') String? get frequency;@JsonKey(name: 'duration') String? get duration;@JsonKey(name: 'instructions') String? get instructions;@JsonKey(name: 'type') String? get type;
/// Create a copy of ExtractDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtractDetailsCopyWith<ExtractDetails> get copyWith => _$ExtractDetailsCopyWithImpl<ExtractDetails>(this as ExtractDetails, _$identity);

  /// Serializes this ExtractDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtractDetails&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strength,frequency,duration,instructions,type);

@override
String toString() {
  return 'ExtractDetails(strength: $strength, frequency: $frequency, duration: $duration, instructions: $instructions, type: $type)';
}


}

/// @nodoc
abstract mixin class $ExtractDetailsCopyWith<$Res>  {
  factory $ExtractDetailsCopyWith(ExtractDetails value, $Res Function(ExtractDetails) _then) = _$ExtractDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'strength') String? strength,@JsonKey(name: 'frequency') String? frequency,@JsonKey(name: 'duration') String? duration,@JsonKey(name: 'instructions') String? instructions,@JsonKey(name: 'type') String? type
});




}
/// @nodoc
class _$ExtractDetailsCopyWithImpl<$Res>
    implements $ExtractDetailsCopyWith<$Res> {
  _$ExtractDetailsCopyWithImpl(this._self, this._then);

  final ExtractDetails _self;
  final $Res Function(ExtractDetails) _then;

/// Create a copy of ExtractDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? strength = freezed,Object? frequency = freezed,Object? duration = freezed,Object? instructions = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
strength: freezed == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String?,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtractDetails].
extension ExtractDetailsPatterns on ExtractDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtractDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtractDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtractDetails value)  $default,){
final _that = this;
switch (_that) {
case _ExtractDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtractDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ExtractDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'strength')  String? strength, @JsonKey(name: 'frequency')  String? frequency, @JsonKey(name: 'duration')  String? duration, @JsonKey(name: 'instructions')  String? instructions, @JsonKey(name: 'type')  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtractDetails() when $default != null:
return $default(_that.strength,_that.frequency,_that.duration,_that.instructions,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'strength')  String? strength, @JsonKey(name: 'frequency')  String? frequency, @JsonKey(name: 'duration')  String? duration, @JsonKey(name: 'instructions')  String? instructions, @JsonKey(name: 'type')  String? type)  $default,) {final _that = this;
switch (_that) {
case _ExtractDetails():
return $default(_that.strength,_that.frequency,_that.duration,_that.instructions,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'strength')  String? strength, @JsonKey(name: 'frequency')  String? frequency, @JsonKey(name: 'duration')  String? duration, @JsonKey(name: 'instructions')  String? instructions, @JsonKey(name: 'type')  String? type)?  $default,) {final _that = this;
switch (_that) {
case _ExtractDetails() when $default != null:
return $default(_that.strength,_that.frequency,_that.duration,_that.instructions,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtractDetails implements ExtractDetails {
  const _ExtractDetails({@JsonKey(name: 'strength') this.strength, @JsonKey(name: 'frequency') this.frequency, @JsonKey(name: 'duration') this.duration, @JsonKey(name: 'instructions') this.instructions, @JsonKey(name: 'type') this.type});
  factory _ExtractDetails.fromJson(Map<String, dynamic> json) => _$ExtractDetailsFromJson(json);

@override@JsonKey(name: 'strength') final  String? strength;
@override@JsonKey(name: 'frequency') final  String? frequency;
@override@JsonKey(name: 'duration') final  String? duration;
@override@JsonKey(name: 'instructions') final  String? instructions;
@override@JsonKey(name: 'type') final  String? type;

/// Create a copy of ExtractDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtractDetailsCopyWith<_ExtractDetails> get copyWith => __$ExtractDetailsCopyWithImpl<_ExtractDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtractDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtractDetails&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strength,frequency,duration,instructions,type);

@override
String toString() {
  return 'ExtractDetails(strength: $strength, frequency: $frequency, duration: $duration, instructions: $instructions, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ExtractDetailsCopyWith<$Res> implements $ExtractDetailsCopyWith<$Res> {
  factory _$ExtractDetailsCopyWith(_ExtractDetails value, $Res Function(_ExtractDetails) _then) = __$ExtractDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'strength') String? strength,@JsonKey(name: 'frequency') String? frequency,@JsonKey(name: 'duration') String? duration,@JsonKey(name: 'instructions') String? instructions,@JsonKey(name: 'type') String? type
});




}
/// @nodoc
class __$ExtractDetailsCopyWithImpl<$Res>
    implements _$ExtractDetailsCopyWith<$Res> {
  __$ExtractDetailsCopyWithImpl(this._self, this._then);

  final _ExtractDetails _self;
  final $Res Function(_ExtractDetails) _then;

/// Create a copy of ExtractDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? strength = freezed,Object? frequency = freezed,Object? duration = freezed,Object? instructions = freezed,Object? type = freezed,}) {
  return _then(_ExtractDetails(
strength: freezed == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String?,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
