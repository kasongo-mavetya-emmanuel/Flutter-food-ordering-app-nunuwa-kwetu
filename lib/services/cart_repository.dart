
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/models.dart';

class CartRepository{
  FirebaseFirestore firebaseFirestore;
  CartRepository({
    required this.firebaseFirestore,
  });

  double _subtotal=0;
  double? _total=0;

  Stream getCart(String uid){
    return firebaseFirestore.collection('cart').doc(uid).collection('cart').snapshots().map((list)
    {
      _subtotal=0;
      return list.docs.map((doc){
        CartProductModel productModel= CartProductModel.fromDoc(doc);

        _subtotal= _subtotal + (productModel.price!*productModel.quantity);
        return productModel;
      }).toList();
    }).map((event){
      subtotal();
      deliveryFee();
      total();
      return event;
    });
  }

  double total(){
    _total = 0;
    _total= _subtotal+deliveryFee();
    return _total!;}

  double subtotal(){
    return _subtotal;}

  double deliveryFee(){
    if(subtotal()<=30.0){
      return 5.0;
    }
    else{
      return 0.0;
    }
  }


  Future addCartOrincreaseQty(String uid, CartProductModel cartProductModel)async{
    final cart=await firebaseFirestore.collection('cart').doc(uid).collection('cart').doc(cartProductModel.id).get();

    if(cart.data()==null){
      await firebaseFirestore.collection('cart').doc(uid).collection('cart').doc(cartProductModel.id).set(cartProductModel.toMap());
    }
    else{
     await firebaseFirestore.collection('cart').doc(uid).collection('cart').doc(cartProductModel.id).update({'quantity':cartProductModel.quantity+1});
    }
  }
  Future decreaseQty(String uid, CartProductModel cartProductModel)async{
    if(cartProductModel.quantity>1){


      await firebaseFirestore.collection('cart').doc(uid).collection('cart').doc(cartProductModel.id).update({'quantity':cartProductModel.quantity-1});
    }
    else if(cartProductModel.quantity==1){

    await firebaseFirestore.collection('cart').doc(uid).collection('cart').doc(cartProductModel.id).delete();}

  }


}