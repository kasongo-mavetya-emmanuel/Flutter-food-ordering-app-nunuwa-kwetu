import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../models/models.dart';
import '../../../services/cart_repository.dart';

class CustomCartListView extends StatelessWidget {
  List<CartProductModel> cartproducts;
  CustomCartListView({Key? key, required this.cartproducts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartproducts.length,
        itemBuilder:(_, index){
      return Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: 70,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(cartproducts[index].image!),fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Text(cartproducts[index].name!, style: kdarkTextColor),
                    SizedBox(height: 5.0,),
                    Text(cartproducts[index].price.toString(), style:kdarkTextColor)
                  ],
                )

              ],),

              Row(
                children: [
                  IconButton(onPressed: (){

                    context.read<CartRepository>().decreaseQty(context.read<User?>()!.uid,
                        CartProductModel(id: cartproducts[index].id, quantity: cartproducts[index].quantity ));

                  }, icon: Icon(Icons.remove_circle_outline,)),
                  Text(cartproducts[index].quantity.toString(), style:kdarkTextColor),
                  IconButton(onPressed: (){

                    context.read<CartRepository>().addCartOrincreaseQty(context.read<User?>()!.uid,
                        CartProductModel(id: cartproducts[index].id, quantity: cartproducts[index].quantity ));

                  }, icon: Icon(Icons.add_circle_outline)),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}