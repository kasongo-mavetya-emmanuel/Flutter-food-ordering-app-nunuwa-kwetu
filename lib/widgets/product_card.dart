
import 'package:ecommerce_app/utils/utils.dart';

import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
  String name;
  String imgUrl;
  String price;
  VoidCallback? addToCart;
  ProductCard({Key? key,required this.imgUrl, required this.name, required this.price, this.addToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(imgUrl,fit: BoxFit.cover,),
        Positioned(
          bottom: 6,
            left: 6,
            right: 6,
            child: Container(
              color: Colors.black.withAlpha(70),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  color: AppTheme().buildTheme().primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                  Text(name, softWrap: true,),
                                  Text('\$$price'),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: addToCart,
                          icon: Icon(Icons.add_circle_outline,color: Colors.white,)),

                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
