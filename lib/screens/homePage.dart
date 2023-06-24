
import 'package:flutter/material.dart';
import 'package:store_app/models/allProductsModel.dart';
import 'package:store_app/screens/updateProductPage.dart';

import '../sevices/allProductsServices.dart';
import '../widgets/customCard.dart';
bool? favourite;
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  List<ProductsModel> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

          centerTitle: true,
          title: const Text(
            'New Trend',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: FutureBuilder<List<ProductsModel>>(
              future: ProductsServices().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductsModel> products = snapshot.data!;
                  return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20),
                    itemBuilder: (context, index) =>
                        CustomCard(product: products[index]),
                  );
                } else {
                  return

                    // Center(child: Text('thereljjbkhjvbihvhj,'));

                    const   Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
