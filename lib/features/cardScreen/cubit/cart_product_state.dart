import 'package:app_e_commers/features/cardScreen/model/cartModel.dart';

abstract class CartState {}

class InitialCartState extends CartState {}

class LoadingCarts extends CartState {}

class SuccessGettingCarts extends CartState {
  final Cartmodel cart;
  SuccessGettingCarts(this.cart);
}

class ErrorGettingCarts extends CartState {
  final String message;
  ErrorGettingCarts(this.message);
}

class AddingToCart extends CartState {}

class SuccessAddingToCarts extends CartState {
  final Cartmodel cart;
  SuccessAddingToCarts(this.cart);
}

class ErrorAddingToCart extends CartState {
  final String message;
  ErrorAddingToCart(this.message);
}
