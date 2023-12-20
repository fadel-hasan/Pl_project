import 'dart:convert';
import 'package:frontend/models/login_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<loginResponseModel> login(loginRequestModel requestModel) async {
    String url = 'Localhost:8000/api/login';
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return loginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
