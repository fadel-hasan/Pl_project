class loginResponseModel {
  final String token;
  final String error;
  loginResponseModel({required this.error, required this.token});
  factory loginResponseModel.fromJson(Map<String, dynamic> json) {
    return loginResponseModel(
        token: json['token'] != null ? json['token'] : '',
        error: json['error'] != null ? json['error'] : '');
  }
}

class loginRequestModel {
  String email;
  String password;
  loginRequestModel({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
