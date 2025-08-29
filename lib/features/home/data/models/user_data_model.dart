import 'dart:convert';
import 'package:e_commerce_clot/core/entities/user_entity.dart';

class UserDataModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  UserDataModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'image': image,
      'gender': gender,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      userId: map['userId'] ?? "",
      firstName: map['firstname'] as String,
      lastName: map['lastname'] as String,
      email: map['email'] as String,
      image: map['image'] ?? '',
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

    factory UserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

}

extension UserXModel on UserDataModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image,
      gender: gender,
    );
  }
}
