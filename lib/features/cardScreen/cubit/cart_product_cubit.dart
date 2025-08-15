import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/cardScreen/model/cartModel.dart';
import 'package:app_e_commers/features/cardScreen/repo/cart_repo.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_product_state.dart';

class CartProductCubit extends Cubit<CartProductState> {
  CartProductCubit() : super(CartProductInitial());

  void getCart() async {
    emit(LodingGettingCart());
    final res = await sl<CartRepo>().getAllCart();
    res.fold(
      (erroe) {
        emit(ErrorGettingCart(erroe));
      },
      (cart) {
        emit(SuccessGettingCart(cart));
      },
    );
  }

  void addingCart({
    required ProductModel product,
    required int quantity,
  }) async {
    emit(LodingGettingCart());
    DateTime dateTime = DateTime.now();
    final res = await sl<CartRepo>().addToCart(
      date: dateTime.toString(),
      product: product,
      quantity: quantity,
    );
    res.fold(
      (erroe) {
        emit(ErrorGettingCart(erroe));
      },
      (cart) {
        emit(SuccessGettingCart(cart));
      },
    );
  }
}
