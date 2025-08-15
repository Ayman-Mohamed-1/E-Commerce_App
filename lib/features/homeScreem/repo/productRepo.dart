// ignore_for_file: file_names

import 'package:app_e_commers/core/networking/api_endpoints.dart';
import 'package:app_e_commers/core/networking/dio_helper.dart';
import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  Future<List<ProductModel>> getPoructs() async {
    final List<ProductModel> products = [];
    final Response response = await sl<DioHelper>().getRequest(
      endPoint: ApiEndpoints.products,
    );
    final dynamic productsData = response.data;
    for (var productMap in productsData) {
      products.add(ProductModel.fromJson(productMap));
    }
    return products;
  }

  Future<List<Category>> getCategories() async {
    final List<Category> categories = [];
    final Response response = await sl<DioHelper>().getRequest(
      endPoint: ApiEndpoints.categories,
    );
    final List<dynamic> categoriesData = response.data;
    for (var categorieString in categoriesData) {
      final categoryEnum = categoryValues.map[categorieString];
      if (categoryEnum != null) {
        categories.add(categoryEnum);
      }
    }
    return categories;
  }
}
