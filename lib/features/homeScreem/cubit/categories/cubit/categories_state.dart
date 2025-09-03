part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategorieLoading extends CategoriesState {}

final class CategorieLoaded extends CategoriesState {
  final List<String> categorie;

  CategorieLoaded(this.categorie);
}

class CategorieError extends CategoriesState {
  final String message;

  CategorieError(this.message);
}
