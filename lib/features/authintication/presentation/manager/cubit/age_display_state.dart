part of 'age_display_cubit.dart';

@immutable
sealed class AgeDisplayState {}

final class AgeDisplayLoading extends AgeDisplayState {}

final class AgeDisplayLoaded extends AgeDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  AgeDisplayLoaded({required this.ages});
}

final class AgeDisplayFailure extends AgeDisplayState {
  final String message;

  AgeDisplayFailure({required this.message});
  
}
