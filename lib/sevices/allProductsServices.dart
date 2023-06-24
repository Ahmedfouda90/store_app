import 'package:store_app/helper/api.dart';
import 'package:store_app/models/allProductsModel.dart';
class ProductsServices {
  // String baseUrl = 'https://fakestoreapi.com';

  bool isFavourite=false;

  Future<List<ProductsModel>> getAllProducts() async {

    List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products');
       // List<dynamic> data=jsonDecode(response.body);
       List<ProductsModel> productsList=[];
       for(int i=0;i<data.length;i++){

         productsList.add(ProductsModel.fromJson(data[i]));
       }

       return productsList;
     }
  }
