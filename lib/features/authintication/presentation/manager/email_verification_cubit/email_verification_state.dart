part of 'email_verification_cubit.dart';

@immutable
sealed class EmailVerificationState {}

final class EmailVerificationInitial
    extends EmailVerificationState {}

final class EmailVerificationChecking
    extends EmailVerificationState {}

final class EmailVerificationResending
    extends EmailVerificationState {}

final class EmailVerificationSent
    extends EmailVerificationState {}

final class EmailVerified
    extends EmailVerificationState {}

final class EmailNotVerified
    extends EmailVerificationState {}

final class EmailVerificationFailure
    extends EmailVerificationState {
  final String message;

  EmailVerificationFailure({
    required this.message,
  });
}