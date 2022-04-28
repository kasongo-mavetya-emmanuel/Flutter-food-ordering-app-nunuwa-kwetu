import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/cart_screen/components/components.dart';
import 'package:ecommerce_app/services/cart_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StreamBuilderCart extends StatelessWidget {
  const StreamBuilderCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.watch<CartRepository>().getCart(context.read<User?>()!.uid),
        builder: (context, AsyncSnapshot snapshot) {
          print('fffffffffffffff${snapshot}');
          print('fffffffffffffffffffffffff${snapshot.data}');
          if (!snapshot.hasData) {
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Container();
          }
          List<CartProductModel> cartProducts =
          snapshot.data! as List<CartProductModel>;
          print('fffffffffffffffffffffffffff${snapshot.data}');
          print('fffffffffffffffffffffffffff${cartProducts}');
          return Column(
            children: [
              Expanded(
                flex:5,
                  child: CustomCartListView(cartproducts: cartProducts)),
              Expanded(
                flex:3,
                child: TotalDetails(),)
            ],
          );
        });
  }
}