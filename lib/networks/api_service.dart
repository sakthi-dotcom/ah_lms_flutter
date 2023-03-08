import 'dart:developer';
import 'package:http/http.dart' as http;
import 'const.dart';
import 'model.dart';


class ApiService{
  Future<ProductDataModel?> getUsers() async{
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productEndpoint);
      var response = await http.get(url);
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        ProductDataModel _model = productDataModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }


}

