class SignUpEntity {
  final String fullName;
  final String phone;
  final String email;
  final int gender;
  final String password;

  const SignUpEntity({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.gender,
    required this.password,
  });
}