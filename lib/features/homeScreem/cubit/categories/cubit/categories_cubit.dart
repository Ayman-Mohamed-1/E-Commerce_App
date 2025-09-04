import 'dart:developer';

import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/homeScreem/repo/productRepo.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitial());
  final ProductRepo _homeRepo;
  final repo = sl<ProductRepo>();
  getAllCategorie() async {
    emit(CategorieLoading());
    final categorie = await _homeRepo.getCategories();
    categorie.fold(
      (error) {
        emit(CategorieError(error));
      },
      (categorie) {
        log(categorie.toString());
        emit(CategorieLoaded(categorie));
      },
    );
  }
}
