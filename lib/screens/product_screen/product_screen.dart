import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName='/product';
  ProductModel productModel;

  static Route route({required ProductModel productModel}){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName,arguments: productModel),
        builder: (_)=> ProductScreen(productModel: productModel,));
  }
  ProductScreen({Key? key, required this.productModel}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: productModel.name,),
      body: Column(
        children: [
          ProductCarousel(productModel: productModel),
          ProductDetails(productModel: productModel),
          Description(),
        ],
      ),
      bottomSheet:Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: AppTheme().buildTheme().primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0,-1)
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.share,color: Colors.white,),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),backgroundColor: Colors.white),
                  onPressed: (){},
                  child: Text('Add to Cart', style: AppTheme().buildTheme().textTheme.headline4!.copyWith(fontWeight:FontWeight.w600,color: Colors.black),)),
              Icon(Icons.shopping_cart_outlined, color: Colors.white,),
              Icon(Icons.favorite_border_outlined, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}





