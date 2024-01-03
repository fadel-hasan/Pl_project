class ApiConstance {
  static String baseUrl = 'http://192.168.84.46:8000/api';

  static String allGruds = '$baseUrl/medicine/';

  static String allCategory = '$baseUrl/category/';

  static String grudByCategory(int id ) => '$baseUrl/medicine?class=$id';

  static String getAllOrder = '$baseUrl/order/pharmacist';

  static String orderByID(int id ) => '$baseUrl/order/$id';
}
