import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../utils/utils.dart';

class AddMoreItems extends StatelessWidget {
  const AddMoreItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('Add more items for free delivery', style: kdarkTextColor.copyWith(fontWeight:FontWeight.bold),),
      TextButton(onPressed: (){},
          style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),backgroundColor: AppTheme().buildTheme().primaryColor),
          child: Text('Add More Items',style: TextStyle(color: Colors.white),)),
    ],);
  }
}