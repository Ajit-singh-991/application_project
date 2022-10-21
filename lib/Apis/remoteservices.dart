import 'dart:developer';

import 'package:application_project/Apis/ApisConstant.dart';
import 'package:application_project/Apis/pictures.dart';
import 'package:application_project/Apis/users.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Users>?> getPosts() async {
    try {
      var client = http.Client();

      var uri = Uri.parse(ApisConstant.baseUrl + ApisConstant.usersEndpoint);
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        return usersFromJson(json);
      }
      return null;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class RemoteServicesApi {
  Future<Pictures?> getPics() async {
    try {
      var client = http.Client();

      var uri = Uri.parse(ApisConstant.baseUrl2 + ApisConstant.apikey);
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        return picturesFromJson(json);
      }
      return null;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
