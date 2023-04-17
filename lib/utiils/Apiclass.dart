import 'dart:convert';

import 'package:appjsonpost/screens/Product/Model/ProductModel.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<List<dynamic>> ProductGetApi() async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/products.php";

    Uri uri = Uri.parse(Link);

    var responce = await http.get(uri);

    var json = jsonDecode(responce.body);

    List<dynamic> p1 = json
        .map(
          (e) => ProductModel().ProductFromJson(e),
        )
        .toList();

    return p1;
  }

  Future<String> ProductPostApi() async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";

    Uri uri = Uri.parse(Link);

    var responce = await http.post(
      uri,
      body: {
        "p_name": "name",
        "p_rate": "rate",
        "p_price": "price",
        "p_offer": "offer",
        "p_desc": "desc",
        "p_category": "category",
      }
    );

    var json = jsonDecode(responce.body);
    print(json);

    if(responce.statusCode == 200){
      return "Success";
    }
    return "Failed";
  }
}
