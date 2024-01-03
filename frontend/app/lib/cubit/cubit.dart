import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/api/apiConstance.dart';
import 'package:frontend/cubit/states.dart';
import 'package:http/http.dart' as http;

import '../model/allModel.dart';
import '../model/all_grud_by_category.dart';
import '../model/all_order_model.dart';
import '../model/category.dart';
import '../model/details_order_model.dart';
import '../models/token_model.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<AllGrudsModel> list = [];

  void getAllGrud() async {
    String? loginToken = await UserPreferences.getLoginToken();
    print("hello@");
    void response = await http.get(Uri.parse(ApiConstance.allGruds), headers: {
      "Accept": "application/json",
      'Authorization': "Bearer $loginToken"
    }).then(
      (value) {
        var listDecode = jsonDecode(value.body);
        listDecode['data']
            .forEach((element) => {list.add(AllGrudsModel.fromJson(element))});
        print(list[0].name);
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }

  List<CategoryModel> categoryList = [];

  void getAllCategory() async {
    String? loginToken = await UserPreferences.getLoginToken();
    print("hello@");
    void response = await http.get(Uri.parse(ApiConstance.allCategory),
        headers: {
          "Accept": "application/json",
          'Authorization': "Bearer $loginToken"
        }).then(
      (value) {
        var listDecode = jsonDecode(value.body);
        listDecode['data'].forEach(
            (element) => {categoryList.add(CategoryModel.fromJson(element))});
        print(categoryList[0].name);
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }

  List<AllGrudsByCategoryModel> grudByCategory = [];

  void getGrudByCategory(int id) async {
    emit(LoadingAllGrudState());
    String? loginToken = await UserPreferences.getLoginToken();

    void response = await http.get(Uri.parse(ApiConstance.grudByCategory(id)),
        headers: {
          "Accept": "application/json",
          'Authorization': "Bearer $loginToken"
        }).then((value) {
      var listDecode = jsonDecode(value.body);
      listDecode['data'].forEach(
        (element) =>
            grudByCategory.add(AllGrudsByCategoryModel.fromJson(element)),
      );
      print(grudByCategory[0].name);
      emit(SuccessAllGrudState());
    }).catchError((error) {
      emit(ErrorAllGrudState());
      print(error.toString());
    });
  }
  List<GetAllOrderModel> getAllOrderModel = [];
  void getAllOrder() async {
    emit(LoadingOrderState());
    String? loginToken = await UserPreferences.getLoginToken();

    void response = await http
        .get(Uri.parse(ApiConstance.getAllOrder), headers: {
          "Accept": "application/json",
          'Authorization': "Bearer $loginToken"
        })
        .then(
          (value) {
            var newList = jsonDecode(value.body);
            newList['data'].forEach((element) => getAllOrderModel.add(GetAllOrderModel.fromJson(element),),);
            print(getAllOrderModel[0].id);
            emit(SuccessOrderState());
          },
        )
        .catchError(
          (error) {
            print(error.toString());
          },
        );
  }

  List<DetailsOrderModel> detailsOrderModel = [];
  void getOrderById(int id)async {
    emit(LoadingOrderIdState());
    String? loginToken = await UserPreferences.getLoginToken();

    void response = await http.get(Uri.parse(ApiConstance.orderByID(id)),
        headers: {
          "Accept": "application/json",
          'Authorization': "Bearer $loginToken"
        }).then((value) {
      var listDecode = jsonDecode(value.body);
      listDecode['data'].forEach(
            (element) =>
                detailsOrderModel.add(DetailsOrderModel.fromJson(element)),
      );
      print(detailsOrderModel[0].name);
      emit(SuccessOrderIdState());
    }).catchError((error) {
      emit(ErrorOrderIdState());
      print(error.toString());
    });
  }
}
