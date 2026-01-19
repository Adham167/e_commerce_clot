part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutFailure extends LogoutState {
  final String errMessage;

  LogoutFailure({required this.errMessage});
}

final class LogoutSuccess extends LogoutState {}
