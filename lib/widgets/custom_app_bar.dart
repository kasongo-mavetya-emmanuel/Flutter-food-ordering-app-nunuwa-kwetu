import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  String? title;
  CustomAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: AppTheme().buildTheme().primaryColor,
        child: Text(title!),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
