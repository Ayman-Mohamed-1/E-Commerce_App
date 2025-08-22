import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:app_e_commers/features/homeScreem/repo/productRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  final repo = sl<ProductRepo>();
  getAllProducts() async {
    emit(ProdectLoading());
    try {
      final List<ProductModel> products = await repo.getPoructs();
      emit(ProdectLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }


}
