import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/providers/login/login_provider.dart';
import 'package:ecommerce_app/screens/login_screen/login_screen.dart';
import 'package:ecommerce_app/screens/product_screen/product_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/cart_repository.dart';
import '../../../utils/utils.dart';
import '';
import '../../../widgets/widgets.dart';
class CustomListView extends StatelessWidget {
  final String title;
  final List<ProductModel>? products;
  const CustomListView({
    Key? key,
    required this.title,
    this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child:Container(
              margin: EdgeInsets.only(top: 10),
                child: Text(title, style: AppTheme().buildTheme().textTheme.headline4!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),)),),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: products!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ProductScreen.routeName, arguments: products![index]);
                    },
                    child: Container(
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      height: double.infinity,
                      child: ProductCard(
                        addToCart: (){
                          if(context.read<User?>() == null){
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          }else{
                            context.read<CartRepository>().addCartOrincreaseQty(context.read<User?>()!.uid,
                                CartProductModel(name: products![index].name,
                                    category: products![index].category,id: products![index].id,
                                    image: products![index].images[0], price: products![index].price));

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('producted added to cart!')),
                            );
                          }
                        },
                          name: products![index].name,
                          price: products![index].price.toString(),
                          imgUrl: products![index].images[0]),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}