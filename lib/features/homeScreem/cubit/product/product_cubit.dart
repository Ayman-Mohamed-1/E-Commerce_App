import 'dart:developer';

import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:app_e_commers/features/homeScreem/repo/productRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(ProductRepo productRepo) : super(ProductInitial());
  final repo = sl<ProductRepo>();

  getAllProducts() async {
    emit(ProdectLoading());
    final products = await repo.getProducts();
    products.fold(
      (error) {
        emit(ProductError(error));
      },
      (products) {
        emit(ProdectLoaded(products));
      },
    );
  }

  void fetchProductCategories(String catName) async {
    emit(ProdectLoading());

    final res = await repo.getProductsCategories(catName);

    res.fold(
      (error) {
        log(error.toString());
        emit(ProductError(error));
      },
      (right) {
        log(right.toString());
        emit(ProdectLoaded(right));
      },
    );
  }
}
