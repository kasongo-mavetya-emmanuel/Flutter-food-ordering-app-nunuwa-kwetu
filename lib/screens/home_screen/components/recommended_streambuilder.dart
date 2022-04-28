import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/services/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components.dart';

class RecommendedStreamBuilder extends StatelessWidget {
  const RecommendedStreamBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.watch<ProductRepository>().getRecommendedProducts(),
        builder: (context,AsyncSnapshot snapshot) {
          print('qqqqqqqqqqqqqqqq${snapshot}');
          print('qqqqqqqqqqqqqqqq${snapshot.data}');

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
          List<ProductModel> recommendedProducts= snapshot.data!;
          print('qqqqqqqqqqqqqqqq${recommendedProducts}');
          return CustomListView(title:'RECOMMENDED', products: recommendedProducts);
        }
    );
  }
}
