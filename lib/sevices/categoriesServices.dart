import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import '../models/allProductsModel.dart';

class CategoriesServices {
  Future<List<ProductsModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data =
        await Api().get(url: 'fakestoreapi.com/products/category/$categoryName');
    List<ProductsModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductsModel.fromJson(data[i]));
    }
    return productsList;
  }
}
//https://fakestoreapi.com/products/category/:category_name