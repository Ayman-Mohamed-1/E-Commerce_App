import 'dart:developer';

import 'package:app_e_commers/core/networking/api_endpoints.dart';
import 'package:app_e_commers/core/networking/dio_helper.dart';
import 'package:app_e_commers/core/utils/service_locator.dart';
import 'package:app_e_commers/features/cardScreen/model/cartModel.dart';
import 'package:app_e_commers/features/homeScreem/model/productModel.dart';
import 'package:dartz/dartz.dart';

class CartRepo {
  Future<Either<String, Cartmodel>> getAllCart() async {
    try {
      final respons = await sl<DioHelper>().getRequest(
        endPoint: "${ApiEndpoints.carts}/user/2",
      );
      if (respons.statusCode == 200) {
        Cartmodel cartModel = Cartmodel.fromJson(respons.data[0]);
        return Right(cartModel);
      } else {
        return Left("Error in Getting Cart");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Cartmodel>> addToCart({
    required String date,
    required ProductModel product,
    required int quantity,
  }) async {
    try {
      final respons = await sl<DioHelper>().putRequest(
        endPoint: "${ApiEndpoints.carts}/user/3",
        data: {
          "userId": 2,
          "date": date,
          "products": [
            {"productId": product.id, "quantity": quantity},
          ],
        },
      );
      if (respons.statusCode == 200) {
        Cartmodel cartModel = Cartmodel.fromJson(respons.data);
        log(cartModel.date.toString());
        return Right(cartModel);
      } else {
        return Left("Error in Getting Cart");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
