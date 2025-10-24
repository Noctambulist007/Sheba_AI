// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileRequest _$ProfileRequestFromJson(Map<String, dynamic> json) =>
    _ProfileRequest(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ProfileRequestToJson(_ProfileRequest instance) =>
    <String, dynamic>{
      'first_name': ?instance.firstName,
      'last_name': ?instance.lastName,
      'phone': ?instance.phone,
      'address': ?instance.address,
    };
