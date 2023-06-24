import 'package:store_app/helper/api.dart';

import '../models/allProductsModel.dart';
import 'package:http/http.dart' as http;

class UpdateProductService {
  Future<ProductsModel> updateProduct(
      {required String title,
      required String price,
      required int id,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().Put (url:'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductsModel.fromJson(data);
  }
}
