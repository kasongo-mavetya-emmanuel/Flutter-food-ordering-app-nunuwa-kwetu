import 'package:ecommerce_app/services/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/models.dart';
import 'components.dart';
class PopularStreamBuilder extends StatelessWidget {
  const PopularStreamBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.watch<ProductRepository>().getPopularProducts,
      builder: (context,AsyncSnapshot snapshot) {

        if(!snapshot.hasData){
          return Container();
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator()
            ,);
        }
        if(snapshot.hasError){
          return Container();
        }
        List<ProductModel> popularProducts= snapshot.data! as List<ProductModel>;
        return CustomListView(title:'POPULAR', products: popularProducts);
      }
    );
  }
}