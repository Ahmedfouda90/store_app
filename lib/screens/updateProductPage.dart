import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/allProductsModel.dart';

import '../sevices/upDateProduct.dart';
import '../widgets/cusstomIconButton.dart';
import '../widgets/customTextField.dart';

class UpadetProductPage extends StatefulWidget {
  UpadetProductPage({Key? key}) : super(key: key);
  static String id = 'UpdateProductPage';

  @override
  State<UpadetProductPage> createState() => _UpadetProductPageState();
}

class _UpadetProductPageState extends State<UpadetProductPage> {
  String? productName;
  String? price;
  String? descreption;
  String? image;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title:const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             const   SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  hintText: 'product Name',
                  onSubmitted: (data) {
                    productName = data;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'price',
                  onSubmitted: (data) {
                    price = data;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'descreption',
                  onSubmitted: (data) {
                    descreption = data;
                  },
                ),
                const  SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'image',
                  onSubmitted: (data) {
                    image = data;
                  },
                ),
                const  SizedBox(
                  height: 20,
                ),
                CustomIconButton(
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      // await updateProduct(product);

                      await UpdateProductService().updateProduct(
                          title: productName == null ? product.title : productName!,
                          price: price == null ? product.price.toString() : price!,
                          description: descreption == null ? product.description : descreption!,
                          image: image == null ? product.image : image!,
                          category: product.category,
                          id: product.id);

                      print('succes');
                    } catch (e) {
                      print(e.toString());
                    }

                    isLoading = false;
                    setState(() {});
                    Navigator.pop(context);
                  },
                  iconText: 'update product',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductsModel product) async {
    await UpdateProductService().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        description: descreption == null ? product.description : descreption!,
        image: image == null ? product.image : image!,
        category: product.category,
        id: product.id);
  }
}
