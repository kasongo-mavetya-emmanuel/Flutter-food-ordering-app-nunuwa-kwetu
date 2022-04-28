import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/services/product_repository.dart';
import 'package:ecommerce_app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProductsScreen extends StatelessWidget {
  String category;
  CategoryProductsScreen({Key? key, required this.category}) : super(key: key);

  static const String routeName='/filteredProd';

  static Route route({required String category}){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName,arguments: category),
        builder:(_)=> CategoryProductsScreen(category: category,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category,),
      body: StreamBuilder(
        stream: context.watch<ProductRepository>().filteredProducts(category),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
          List<ProductModel> filteredProducts= snapshot.data! as List<ProductModel>;
          print('zzzzzzzzzzzzzzzzzz${filteredProducts}');
          return GridView.count(crossAxisCount: 2,
            mainAxisSpacing: 4.0,crossAxisSpacing: 4.0,
            children: List.generate(filteredProducts.length, (index){
              return ProductCard(imgUrl: filteredProducts[index].images[0], name: filteredProducts[index].name, price: filteredProducts[index].price.toString());
            }),
          );
        },
      ),
    );
  }
}
