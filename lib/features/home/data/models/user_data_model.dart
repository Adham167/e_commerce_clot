
import 'dart:convert';

import 'package:e_commerce_clot/features/authintication/domain/entities/user_entity.dart';

class UserDataModel {
  final String id;
  final String fullName;
  final String phone;
  final String email;
  final int gender;

  UserDataModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'gender': gender,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) {
    return UserDataModel.fromMap(
      json.decode(source) as Map<String, dynamic>,
    );
  }
}

extension UserXModel on UserDataModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: fullName,
      phone: phone,
      email: email,
      gender: gender,
    );
  }
}

