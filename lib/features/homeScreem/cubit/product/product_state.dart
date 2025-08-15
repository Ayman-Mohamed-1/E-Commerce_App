part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProdectLoading extends ProductState {}

final class ProdectLoaded extends ProductState {
  final List<ProductModel> products;

  ProdectLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}


