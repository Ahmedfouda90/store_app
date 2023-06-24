import 'package:flutter/material.dart';
import 'package:store_app/models/allProductsModel.dart';

import '../screens/updateProductPage.dart';

class CustomCard extends StatefulWidget {
  CustomCard({Key? key, required this.product}) : super(key: key);
  ProductsModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool favourite = false;

  void initState() {
    super.initState();
    favourite = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpadetProductPage.id,
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // color: Colors.black,
            // margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  spreadRadius: 20,
                  offset: const Offset(1, 1),
                  blurRadius: 50,
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
              // shadowColor: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.product.title.substring(0, 8),
                    style:const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' "${widget.product.price.toString()}",
                        style:const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        icon: favourite == false
                            ?const Icon(
                                Icons.favorite,
                                color: Colors.blue,
                              )
                            :const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                        onPressed: () {
                          setState(() {
                            favourite = !favourite;
                          });
                        },
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              left: 80,
              top: -15,
              child: Image.network(
                widget.product.image,
                height: 100,
                width: 100,
              ))
        ],
      ),
    );
  }
}
