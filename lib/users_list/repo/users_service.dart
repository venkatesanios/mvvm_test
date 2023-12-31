import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_test/users_list/models/Users_List_Model.dart';
import 'package:mvvm_test/users_list/repo/api_status.dart';
import 'package:mvvm_test/users_list/utils/constants.dart';

class UserService {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(response: userListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
