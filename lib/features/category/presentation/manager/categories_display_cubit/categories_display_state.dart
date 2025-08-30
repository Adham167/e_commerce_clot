part of 'categories_display_cubit.dart';

@immutable
sealed class CategoriesDisplayState {}

final class CategoriesDisplayLoading extends CategoriesDisplayState {}

final class CategoriesDisplayLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;

  CategoriesDisplayLoaded({required this.categories});
}

final class CategoriesDisplayFailure extends CategoriesDisplayState {}
