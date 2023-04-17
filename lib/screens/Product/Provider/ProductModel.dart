import 'package:appjsonpost/screens/Product/Model/ProductModel.dart';
import 'package:appjsonpost/utiils/Apiclass.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier
{
  Future<List<dynamic>> GetApiCall() async {
    ApiHelper apiHelper = ApiHelper();

    List<dynamic> p1 = await apiHelper.ProductGetApi();

    return p1;
  }

  Future<String> PostApiCall() async {
    ApiHelper apiHelper = ApiHelper();
    String msg = await apiHelper.ProductPostApi();
    notifyListeners();
    return msg;
  }
}