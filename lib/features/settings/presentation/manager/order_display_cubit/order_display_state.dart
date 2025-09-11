part of 'order_display_cubit.dart';

@immutable
sealed class OrderDisplayState {}

final class OrderDisplayInitial extends OrderDisplayState {}

final class OrderDisplayLoading extends OrderDisplayState {}

final class OrderDisplayLoaded extends OrderDisplayState {
  final List<OrederEntity> orders;

  OrderDisplayLoaded({required this.orders});
}

final class OrderDisplayFailure extends OrderDisplayState {
  final String errMessage;

  OrderDisplayFailure({required this.errMessage});
}
