// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileRequest {

@JsonKey(name: 'first_name', includeIfNull: false) String? get firstName;@JsonKey(name: 'last_name', includeIfNull: false) String? get lastName;@JsonKey(name: 'phone', includeIfNull: false) String? get phone;@JsonKey(name: 'address', includeIfNull: false) String? get address;
/// Create a copy of ProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileRequestCopyWith<ProfileRequest> get copyWith => _$ProfileRequestCopyWithImpl<ProfileRequest>(this as ProfileRequest, _$identity);

  /// Serializes this ProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phone,address);

@override
String toString() {
  return 'ProfileRequest(firstName: $firstName, lastName: $lastName, phone: $phone, address: $address)';
}


}

/// @nodoc
abstract mixin class $ProfileRequestCopyWith<$Res>  {
  factory $ProfileRequestCopyWith(ProfileRequest value, $Res Function(ProfileRequest) _then) = _$ProfileRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name', includeIfNull: false) String? firstName,@JsonKey(name: 'last_name', includeIfNull: false) String? lastName,@JsonKey(name: 'phone', includeIfNull: false) String? phone,@JsonKey(name: 'address', includeIfNull: false) String? address
});




}
/// @nodoc
class _$ProfileRequestCopyWithImpl<$Res>
    implements $ProfileRequestCopyWith<$Res> {
  _$ProfileRequestCopyWithImpl(this._self, this._then);

  final ProfileRequest _self;
  final $Res Function(ProfileRequest) _then;

/// Create a copy of ProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? phone = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileRequest].
extension ProfileRequestPatterns on ProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _ProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'phone', includeIfNull: false)  String? phone, @JsonKey(name: 'address', includeIfNull: false)  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'phone', includeIfNull: false)  String? phone, @JsonKey(name: 'address', includeIfNull: false)  String? address)  $default,) {final _that = this;
switch (_that) {
case _ProfileRequest():
return $default(_that.firstName,_that.lastName,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'phone', includeIfNull: false)  String? phone, @JsonKey(name: 'address', includeIfNull: false)  String? address)?  $default,) {final _that = this;
switch (_that) {
case _ProfileRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileRequest implements ProfileRequest {
  const _ProfileRequest({@JsonKey(name: 'first_name', includeIfNull: false) this.firstName, @JsonKey(name: 'last_name', includeIfNull: false) this.lastName, @JsonKey(name: 'phone', includeIfNull: false) this.phone, @JsonKey(name: 'address', includeIfNull: false) this.address});
  factory _ProfileRequest.fromJson(Map<String, dynamic> json) => _$ProfileRequestFromJson(json);

@override@JsonKey(name: 'first_name', includeIfNull: false) final  String? firstName;
@override@JsonKey(name: 'last_name', includeIfNull: false) final  String? lastName;
@override@JsonKey(name: 'phone', includeIfNull: false) final  String? phone;
@override@JsonKey(name: 'address', includeIfNull: false) final  String? address;

/// Create a copy of ProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileRequestCopyWith<_ProfileRequest> get copyWith => __$ProfileRequestCopyWithImpl<_ProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phone,address);

@override
String toString() {
  return 'ProfileRequest(firstName: $firstName, lastName: $lastName, phone: $phone, address: $address)';
}


}

/// @nodoc
abstract mixin class _$ProfileRequestCopyWith<$Res> implements $ProfileRequestCopyWith<$Res> {
  factory _$ProfileRequestCopyWith(_ProfileRequest value, $Res Function(_ProfileRequest) _then) = __$ProfileRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name', includeIfNull: false) String? firstName,@JsonKey(name: 'last_name', includeIfNull: false) String? lastName,@JsonKey(name: 'phone', includeIfNull: false) String? phone,@JsonKey(name: 'address', includeIfNull: false) String? address
});




}
/// @nodoc
class __$ProfileRequestCopyWithImpl<$Res>
    implements _$ProfileRequestCopyWith<$Res> {
  __$ProfileRequestCopyWithImpl(this._self, this._then);

  final _ProfileRequest _self;
  final $Res Function(_ProfileRequest) _then;

/// Create a copy of ProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? phone = freezed,Object? address = freezed,}) {
  return _then(_ProfileRequest(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
