// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileResponse {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'username') String get username;@JsonKey(name: 'email') String get email;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'phone') String? get phone;@JsonKey(name: 'address') String? get address;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileResponseCopyWith<ProfileResponse> get copyWith => _$ProfileResponseCopyWithImpl<ProfileResponse>(this as ProfileResponse, _$identity);

  /// Serializes this ProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,firstName,lastName,phone,address,createdAt);

@override
String toString() {
  return 'ProfileResponse(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProfileResponseCopyWith<$Res>  {
  factory $ProfileResponseCopyWith(ProfileResponse value, $Res Function(ProfileResponse) _then) = _$ProfileResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'username') String username,@JsonKey(name: 'email') String email,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'address') String? address,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._self, this._then);

  final ProfileResponse _self;
  final $Res Function(ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? phone = freezed,Object? address = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileResponse].
extension ProfileResponsePatterns on ProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'username')  String username, @JsonKey(name: 'email')  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.firstName,_that.lastName,_that.phone,_that.address,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'username')  String username, @JsonKey(name: 'email')  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse():
return $default(_that.id,_that.username,_that.email,_that.firstName,_that.lastName,_that.phone,_that.address,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'username')  String username, @JsonKey(name: 'email')  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.firstName,_that.lastName,_that.phone,_that.address,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileResponse implements ProfileResponse {
  const _ProfileResponse({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'username') required this.username, @JsonKey(name: 'email') required this.email, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'phone') this.phone, @JsonKey(name: 'address') this.address, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'username') final  String username;
@override@JsonKey(name: 'email') final  String email;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'phone') final  String? phone;
@override@JsonKey(name: 'address') final  String? address;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileResponseCopyWith<_ProfileResponse> get copyWith => __$ProfileResponseCopyWithImpl<_ProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,firstName,lastName,phone,address,createdAt);

@override
String toString() {
  return 'ProfileResponse(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileResponseCopyWith<$Res> implements $ProfileResponseCopyWith<$Res> {
  factory _$ProfileResponseCopyWith(_ProfileResponse value, $Res Function(_ProfileResponse) _then) = __$ProfileResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'username') String username,@JsonKey(name: 'email') String email,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'address') String? address,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$ProfileResponseCopyWithImpl<$Res>
    implements _$ProfileResponseCopyWith<$Res> {
  __$ProfileResponseCopyWithImpl(this._self, this._then);

  final _ProfileResponse _self;
  final $Res Function(_ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? phone = freezed,Object? address = freezed,Object? createdAt = null,}) {
  return _then(_ProfileResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
