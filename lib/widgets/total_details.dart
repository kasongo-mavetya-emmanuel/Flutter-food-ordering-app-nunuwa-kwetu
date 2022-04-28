import 'package:ecommerce_app/services/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../utils/utils.dart';

class TotalDetails extends StatefulWidget {
  const TotalDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalDetails> createState() => _TotalDetailsState();
}

class _TotalDetailsState extends State<TotalDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('SUBTOTAL', style:kdarkTextColor.copyWith(fontWeight: FontWeight.bold)),
          Text(context.watch<CartRepository>().subtotal().toString(), style:kdarkTextColor.copyWith(fontWeight: FontWeight.bold)),
        ],),
        SizedBox(height: 5.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('DELIVERY FEE',style:kdarkTextColor.copyWith(fontWeight: FontWeight.bold)),
          Text(context.watch<CartRepository>().deliveryFee().toString(),style:kdarkTextColor.copyWith(fontWeight: FontWeight.bold)),
        ],),
        SizedBox(height: 5.0,),
        Container(
          padding: EdgeInsets.all(8.0),
          color:  Colors.black.withAlpha(70),
          height: 50,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TOTAL', style: AppTheme().buildTheme().textTheme.headline4!.copyWith(fontWeight:FontWeight.bold)),
                Text(context.watch<CartRepository>().total().toString(), style: AppTheme().buildTheme().textTheme.headline2!.copyWith(fontWeight:FontWeight.bold)),
              ],
            ),
          ),
        )

      ],),
    );
  }
}