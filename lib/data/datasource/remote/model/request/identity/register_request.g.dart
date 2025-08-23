// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      password2: json['password2'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'password': instance.password,
      'password2': instance.password2,
    };
