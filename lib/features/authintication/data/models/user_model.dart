import 'package:e_commerce_clot/features/authintication/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String fullName;
  final String phone;
  final String email;
  final int gender;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      fullName: user.fullName,
      phone: user.phone,
      email: user.email,
      gender: user.gender,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'gender': gender,
    };
  }
}
