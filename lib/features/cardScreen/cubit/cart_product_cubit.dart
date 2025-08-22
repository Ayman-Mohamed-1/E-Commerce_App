import 'dart:developer';

import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/cardScreen/cubit/cart_product_state.dart';
import 'package:app_e_commers/features/cardScreen/repo/cart_repo.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCubit extends Cubit<CartState> {
  CartProductCubit() : super(InitialCartState());

  getCart() async {
    emit(LoadingCarts());
    final res = await sl<CartRepo>().getAllCart();
    res.fold(
      (error) {
        log(error.toString());
        emit(ErrorGettingCarts(error));
      },
      (cart) {
        emit(SuccessGettingCarts(cart));
      },
    );
  }

  addingCart({required ProductModel product, required int quantity}) async {
    emit(AddingToCart());
    // if(state is clos)
    DateTime dateTime = DateTime.now();
    final res = await sl<CartRepo>().addToCart(
      date: dateTime.toString(),
      product: product,
      quantity: quantity,
    );

    res.fold(
      (erroe) {
        emit(ErrorAddingToCart(erroe));
      },
      (cart) {
        if (!isClosed) {
          emit(SuccessGettingCarts(cart));
        }
      },
    );
  }
}
