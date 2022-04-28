
import 'package:ecommerce_app/services/cart_repository.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/widgets.dart';
import '../checkout_screen/checkout_screen.dart';
import 'components/components.dart';

class CartScreen extends StatelessWidget {
  static const String routeName='/cart';

  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_)=> CartScreen());
  }
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart',),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: AddMoreItems()),
            Expanded(
              flex: 4,
                child: StreamBuilderCart()),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 60,
       child: Center(
          child: TextButton(
            style: TextButton.styleFrom(
               primary: Colors.white,
                backgroundColor: AppTheme().buildTheme().primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)),
            onPressed: context.watch<CartRepository>().total()==0?null:() {
              Navigator.pushNamed(context, CheckoutScreen.routeName);
            },
            child: Text('GO TO CHECKOUT',),
          ),
        )
      ),
    );
  }
}







