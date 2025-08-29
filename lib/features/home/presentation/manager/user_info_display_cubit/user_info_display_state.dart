part of 'user_info_display_cubit.dart';

@immutable
sealed class UserInfoDisplayState {}

final class UserInfoDisplayLoading extends UserInfoDisplayState {}

final class UserInfoDisplayLoaded extends UserInfoDisplayState {
  final UserEntity userEntity;

  UserInfoDisplayLoaded({required this.userEntity});
}

final class UserInfoDisplayFailure extends UserInfoDisplayState {}
