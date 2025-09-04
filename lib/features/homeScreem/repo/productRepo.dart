// ignore_for_file: file_names

import 'dart:developer';

import 'package:app_e_commers/core/networking/api_endpoints.dart';
import 'package:app_e_commers/core/networking/dio_helper.dart';
import 'package:app_e_commers/features/homeScreem/model/categoriesModel.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:dartz/dartz.dart';

class ProductRepo {
  final DioHelper _dioHelper;

  ProductRepo(this._dioHelper);
  Future<Either<String, List<ProductsModel>>> getProducts() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.products,
      );

      if (response.statusCode == 200) {
        List<ProductsModel> products = productsModelFromJson(response.data);

        return Right(products);
      } else {
        return Left("Something went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductsModel>>> getProductsCategories(
    String catName,
  ) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint:
            "${ApiEndpoints.products}/${ApiEndpoints.catProducts}/$catName",
      );

      if (response.statusCode == 200) {
        List<ProductsModel> products = productsModelFromJson(response.data);
        return Right(products);
      } else {
        return Left("Something went wrong");
      }
    } catch (e) {
      log("${ApiEndpoints.products}${ApiEndpoints.catProducts}/$catName");
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.categories,
        // endPoint: ApiEndpoints.products,
      );

      if (response.statusCode == 200) {
        List<String> categories = ["All"];
        categories.addAll(categoriesModelFromJson(response.data));

        return Right(categories);
      } else {
        return Left("Something went wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
