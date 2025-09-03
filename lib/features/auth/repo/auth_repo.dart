// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/networking/api_endpoints.dart';
import '../../../core/networking/dio_helper.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/utils/storage_hlper.dart';
import '../modles/login_response_model.dart';

class AuthRepo {


  final DioHelper _dioHelper;

  AuthRepo(this._dioHelper);

  Future<Either<String, LoginResponseModel>> login(
    String userName,
    String password,
  ) async {
    try {
      final response = await sl<DioHelper>().postRequest(
        endPoint: ApiEndpoints.login,
        data: {"username": userName, "password": password},
      );
      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
          response.data,
        );

        if (loginResponseModel.token != null) {
          await sl<StorageHeper>().saveData("token", loginResponseModel.token!);
          return Right(loginResponseModel);
        } else {
          return const Left("Login failed, please try again");
        }
      } else {
        return Left(response.toString());
      }
      //
      //  error handling
    } catch (e) {
      if (e is DioException) {
        return Left(e.response.toString());
      }
      return Left(e.toString());
    }
  }
}
