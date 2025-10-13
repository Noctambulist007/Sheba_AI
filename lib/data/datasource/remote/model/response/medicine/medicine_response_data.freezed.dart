// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicineResponseData {

@JsonKey(name: 'medicine_id') int get medicineId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'slug') String get slug;@JsonKey(name: 'strength') String get strength;@JsonKey(name: 'manufacturer') ManufacturerResponseData get manufacturer;@JsonKey(name: 'generic') GenericResponseData get generic;@JsonKey(name: 'dosage_form') DosageFormResponseData get dosageForm;@JsonKey(name: 'price') String? get price;@JsonKey(name: 'formatted_price') String? get formattedPrice;@JsonKey(name: 'unit') String get unit;
/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicineResponseDataCopyWith<MedicineResponseData> get copyWith => _$MedicineResponseDataCopyWithImpl<MedicineResponseData>(this as MedicineResponseData, _$identity);

  /// Serializes this MedicineResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicineResponseData&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.generic, generic) || other.generic == generic)&&(identical(other.dosageForm, dosageForm) || other.dosageForm == dosageForm)&&(identical(other.price, price) || other.price == price)&&(identical(other.formattedPrice, formattedPrice) || other.formattedPrice == formattedPrice)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medicineId,name,slug,strength,manufacturer,generic,dosageForm,price,formattedPrice,unit);

@override
String toString() {
  return 'MedicineResponseData(medicineId: $medicineId, name: $name, slug: $slug, strength: $strength, manufacturer: $manufacturer, generic: $generic, dosageForm: $dosageForm, price: $price, formattedPrice: $formattedPrice, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $MedicineResponseDataCopyWith<$Res>  {
  factory $MedicineResponseDataCopyWith(MedicineResponseData value, $Res Function(MedicineResponseData) _then) = _$MedicineResponseDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'medicine_id') int medicineId,@JsonKey(name: 'name') String name,@JsonKey(name: 'slug') String slug,@JsonKey(name: 'strength') String strength,@JsonKey(name: 'manufacturer') ManufacturerResponseData manufacturer,@JsonKey(name: 'generic') GenericResponseData generic,@JsonKey(name: 'dosage_form') DosageFormResponseData dosageForm,@JsonKey(name: 'price') String? price,@JsonKey(name: 'formatted_price') String? formattedPrice,@JsonKey(name: 'unit') String unit
});


$ManufacturerResponseDataCopyWith<$Res> get manufacturer;$GenericResponseDataCopyWith<$Res> get generic;$DosageFormResponseDataCopyWith<$Res> get dosageForm;

}
/// @nodoc
class _$MedicineResponseDataCopyWithImpl<$Res>
    implements $MedicineResponseDataCopyWith<$Res> {
  _$MedicineResponseDataCopyWithImpl(this._self, this._then);

  final MedicineResponseData _self;
  final $Res Function(MedicineResponseData) _then;

/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? medicineId = null,Object? name = null,Object? slug = null,Object? strength = null,Object? manufacturer = null,Object? generic = null,Object? dosageForm = null,Object? price = freezed,Object? formattedPrice = freezed,Object? unit = null,}) {
  return _then(_self.copyWith(
medicineId: null == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as ManufacturerResponseData,generic: null == generic ? _self.generic : generic // ignore: cast_nullable_to_non_nullable
as GenericResponseData,dosageForm: null == dosageForm ? _self.dosageForm : dosageForm // ignore: cast_nullable_to_non_nullable
as DosageFormResponseData,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,formattedPrice: freezed == formattedPrice ? _self.formattedPrice : formattedPrice // ignore: cast_nullable_to_non_nullable
as String?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManufacturerResponseDataCopyWith<$Res> get manufacturer {
  
  return $ManufacturerResponseDataCopyWith<$Res>(_self.manufacturer, (value) {
    return _then(_self.copyWith(manufacturer: value));
  });
}/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenericResponseDataCopyWith<$Res> get generic {
  
  return $GenericResponseDataCopyWith<$Res>(_self.generic, (value) {
    return _then(_self.copyWith(generic: value));
  });
}/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DosageFormResponseDataCopyWith<$Res> get dosageForm {
  
  return $DosageFormResponseDataCopyWith<$Res>(_self.dosageForm, (value) {
    return _then(_self.copyWith(dosageForm: value));
  });
}
}


/// Adds pattern-matching-related methods to [MedicineResponseData].
extension MedicineResponseDataPatterns on MedicineResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicineResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicineResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicineResponseData value)  $default,){
final _that = this;
switch (_that) {
case _MedicineResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicineResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _MedicineResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'medicine_id')  int medicineId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'strength')  String strength, @JsonKey(name: 'manufacturer')  ManufacturerResponseData manufacturer, @JsonKey(name: 'generic')  GenericResponseData generic, @JsonKey(name: 'dosage_form')  DosageFormResponseData dosageForm, @JsonKey(name: 'price')  String? price, @JsonKey(name: 'formatted_price')  String? formattedPrice, @JsonKey(name: 'unit')  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicineResponseData() when $default != null:
return $default(_that.medicineId,_that.name,_that.slug,_that.strength,_that.manufacturer,_that.generic,_that.dosageForm,_that.price,_that.formattedPrice,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'medicine_id')  int medicineId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'strength')  String strength, @JsonKey(name: 'manufacturer')  ManufacturerResponseData manufacturer, @JsonKey(name: 'generic')  GenericResponseData generic, @JsonKey(name: 'dosage_form')  DosageFormResponseData dosageForm, @JsonKey(name: 'price')  String? price, @JsonKey(name: 'formatted_price')  String? formattedPrice, @JsonKey(name: 'unit')  String unit)  $default,) {final _that = this;
switch (_that) {
case _MedicineResponseData():
return $default(_that.medicineId,_that.name,_that.slug,_that.strength,_that.manufacturer,_that.generic,_that.dosageForm,_that.price,_that.formattedPrice,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'medicine_id')  int medicineId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'slug')  String slug, @JsonKey(name: 'strength')  String strength, @JsonKey(name: 'manufacturer')  ManufacturerResponseData manufacturer, @JsonKey(name: 'generic')  GenericResponseData generic, @JsonKey(name: 'dosage_form')  DosageFormResponseData dosageForm, @JsonKey(name: 'price')  String? price, @JsonKey(name: 'formatted_price')  String? formattedPrice, @JsonKey(name: 'unit')  String unit)?  $default,) {final _that = this;
switch (_that) {
case _MedicineResponseData() when $default != null:
return $default(_that.medicineId,_that.name,_that.slug,_that.strength,_that.manufacturer,_that.generic,_that.dosageForm,_that.price,_that.formattedPrice,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicineResponseData implements MedicineResponseData {
  const _MedicineResponseData({@JsonKey(name: 'medicine_id') required this.medicineId, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'slug') required this.slug, @JsonKey(name: 'strength') required this.strength, @JsonKey(name: 'manufacturer') required this.manufacturer, @JsonKey(name: 'generic') required this.generic, @JsonKey(name: 'dosage_form') required this.dosageForm, @JsonKey(name: 'price') this.price, @JsonKey(name: 'formatted_price') this.formattedPrice, @JsonKey(name: 'unit') required this.unit});
  factory _MedicineResponseData.fromJson(Map<String, dynamic> json) => _$MedicineResponseDataFromJson(json);

@override@JsonKey(name: 'medicine_id') final  int medicineId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'slug') final  String slug;
@override@JsonKey(name: 'strength') final  String strength;
@override@JsonKey(name: 'manufacturer') final  ManufacturerResponseData manufacturer;
@override@JsonKey(name: 'generic') final  GenericResponseData generic;
@override@JsonKey(name: 'dosage_form') final  DosageFormResponseData dosageForm;
@override@JsonKey(name: 'price') final  String? price;
@override@JsonKey(name: 'formatted_price') final  String? formattedPrice;
@override@JsonKey(name: 'unit') final  String unit;

/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicineResponseDataCopyWith<_MedicineResponseData> get copyWith => __$MedicineResponseDataCopyWithImpl<_MedicineResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicineResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicineResponseData&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.generic, generic) || other.generic == generic)&&(identical(other.dosageForm, dosageForm) || other.dosageForm == dosageForm)&&(identical(other.price, price) || other.price == price)&&(identical(other.formattedPrice, formattedPrice) || other.formattedPrice == formattedPrice)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medicineId,name,slug,strength,manufacturer,generic,dosageForm,price,formattedPrice,unit);

@override
String toString() {
  return 'MedicineResponseData(medicineId: $medicineId, name: $name, slug: $slug, strength: $strength, manufacturer: $manufacturer, generic: $generic, dosageForm: $dosageForm, price: $price, formattedPrice: $formattedPrice, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$MedicineResponseDataCopyWith<$Res> implements $MedicineResponseDataCopyWith<$Res> {
  factory _$MedicineResponseDataCopyWith(_MedicineResponseData value, $Res Function(_MedicineResponseData) _then) = __$MedicineResponseDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'medicine_id') int medicineId,@JsonKey(name: 'name') String name,@JsonKey(name: 'slug') String slug,@JsonKey(name: 'strength') String strength,@JsonKey(name: 'manufacturer') ManufacturerResponseData manufacturer,@JsonKey(name: 'generic') GenericResponseData generic,@JsonKey(name: 'dosage_form') DosageFormResponseData dosageForm,@JsonKey(name: 'price') String? price,@JsonKey(name: 'formatted_price') String? formattedPrice,@JsonKey(name: 'unit') String unit
});


@override $ManufacturerResponseDataCopyWith<$Res> get manufacturer;@override $GenericResponseDataCopyWith<$Res> get generic;@override $DosageFormResponseDataCopyWith<$Res> get dosageForm;

}
/// @nodoc
class __$MedicineResponseDataCopyWithImpl<$Res>
    implements _$MedicineResponseDataCopyWith<$Res> {
  __$MedicineResponseDataCopyWithImpl(this._self, this._then);

  final _MedicineResponseData _self;
  final $Res Function(_MedicineResponseData) _then;

/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? medicineId = null,Object? name = null,Object? slug = null,Object? strength = null,Object? manufacturer = null,Object? generic = null,Object? dosageForm = null,Object? price = freezed,Object? formattedPrice = freezed,Object? unit = null,}) {
  return _then(_MedicineResponseData(
medicineId: null == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as ManufacturerResponseData,generic: null == generic ? _self.generic : generic // ignore: cast_nullable_to_non_nullable
as GenericResponseData,dosageForm: null == dosageForm ? _self.dosageForm : dosageForm // ignore: cast_nullable_to_non_nullable
as DosageFormResponseData,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,formattedPrice: freezed == formattedPrice ? _self.formattedPrice : formattedPrice // ignore: cast_nullable_to_non_nullable
as String?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManufacturerResponseDataCopyWith<$Res> get manufacturer {
  
  return $ManufacturerResponseDataCopyWith<$Res>(_self.manufacturer, (value) {
    return _then(_self.copyWith(manufacturer: value));
  });
}/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenericResponseDataCopyWith<$Res> get generic {
  
  return $GenericResponseDataCopyWith<$Res>(_self.generic, (value) {
    return _then(_self.copyWith(generic: value));
  });
}/// Create a copy of MedicineResponseData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DosageFormResponseDataCopyWith<$Res> get dosageForm {
  
  return $DosageFormResponseDataCopyWith<$Res>(_self.dosageForm, (value) {
    return _then(_self.copyWith(dosageForm: value));
  });
}
}

// dart format on
