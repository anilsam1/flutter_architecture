

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/api/api_end_points.dart';
import 'package:flutter_demo_structure/core/api/base_response/base_response.dart';
import 'package:flutter_demo_structure/data/model/request/login_request_model.dart';
import 'package:flutter_demo_structure/data/model/response/user_data_model.dart';
import 'package:flutter_demo_structure/data/model/response/user_profile_response.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserData?>> signIn(LoginRequestModel data);

  Future<BaseResponse> logout();

  Future<UserDataModel?>  getUserData() async{
    Dio dio = Dio();
    var responce =await dio.get(APIEndPoints.baseUrl);
    if(responce.statusCode ==200) {
      debugPrint("responce........................$responce");
      return userDataModelFromJson(responce.data);
    }
    return null;
  }
}
