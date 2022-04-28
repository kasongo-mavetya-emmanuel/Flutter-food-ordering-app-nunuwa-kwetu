import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/screens/category_products_screen/category_products_screen.dart';
import 'package:ecommerce_app/services/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widgets.dart';

class CategoriesCarousel extends StatelessWidget {
  const CategoriesCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.watch<ProductRepository>().getCategories,
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
        List<CategoryModel> categories= snapshot.data!;

        return Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,
              ),
              items: categories.map((category) => InkWell(
                onTap: (){
                  Navigator.pushNamed(context, CategoryProductsScreen.routeName,arguments: category.name);
                },
                  child: HeroCardCarousel(imgUrl: category.imgUrl, name: category.name,))).toList(),
            )
        );
      }
    );
  }
}