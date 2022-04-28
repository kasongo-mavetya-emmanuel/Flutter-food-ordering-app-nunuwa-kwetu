
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/models/product_model.dart';

class ProductRepository{


  Stream<List<CategoryModel>> get getCategories{
    return categoriesRef.snapshots().map((list) => list.docs.map((e){
      return CategoryModel.fromDoc(e);
    }).toList());
  }


  Stream filteredProducts(String category){
    return productsRef.where('category', isEqualTo: category).snapshots().map((list) => list.docs.map((e) {

      return ProductModel.fromDoc(e);
    }
    ).toList());
  }

  Stream<List<ProductModel>> getRecommendedProducts(){
    return productsRef.where('isRecommended', isEqualTo:  true).snapshots().map((list) => list.docs.map((e) {

      return ProductModel.fromDoc(e);
    }
    ).toList());
  }

  Stream<List<ProductModel>> get getPopularProducts{
    return productsRef.where('isPopular', isEqualTo:  true).snapshots().map((list) => list.docs.map((e){
        return ProductModel.fromDoc(e);
    }).toList());
  }


}