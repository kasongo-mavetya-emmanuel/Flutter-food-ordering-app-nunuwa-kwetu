import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.black.withAlpha(70),
      child: Container(
        margin: EdgeInsets.all(5),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.name, style: AppTheme().buildTheme().textTheme.headline3!.copyWith(fontWeight: FontWeight.w600),),
                  Row(
                    children: List.generate(5, (index) => Icon(Icons.star,color: Colors.amber,)),
                  )
                ],
              ),
              Text('\$${productModel.price.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}