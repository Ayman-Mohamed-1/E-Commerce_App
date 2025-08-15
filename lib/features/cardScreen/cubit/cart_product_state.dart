part of 'cart_product_cubit.dart';

sealed class CartProductState {}

final class CartProductInitial extends CartProductState {}

final class LodingGettingCart extends CartProductState {}

final class SuccessGettingCart extends CartProductState {
  final Cartmodel cart;

  SuccessGettingCart(this.cart);
}

final class ErrorGettingCart extends CartProductState {
  final String message;

  ErrorGettingCart(this.message);
}

final class LodingAddingCart extends CartProductState {}

final class LodedAddingCart extends CartProductState {
  final Cartmodel cart;

  LodedAddingCart(this.cart);
}

final class ErrorAddingCart extends CartProductState {
  final String message;

  ErrorAddingCart(this.message);
}
