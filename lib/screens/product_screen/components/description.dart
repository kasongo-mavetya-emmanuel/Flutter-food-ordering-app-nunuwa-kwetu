import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.symmetric(horizontal: 15),
      textColor: Colors.black,
      collapsedIconColor: Colors.black,
      collapsedTextColor: Colors.black,
      iconColor: Colors.black,
      title: Text('Description'),
      children: [
        Text('fkwotvkf fkdfek kereotdgksd fdkgferog kedorkkgdk fdk fdkgkr3g eripg fdeprkvr,vfrekeeotpreporokvr  kreoerpookvoreeporkvvfoevpfvk oetot',
          style:AppTheme().buildTheme().textTheme.bodyText1!.copyWith(color: Colors.black),softWrap: true,)
      ],
    );
  }
}