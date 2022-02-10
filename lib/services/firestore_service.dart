import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_codigo4_menuapp/models/product_model.dart';

class MyFirestoreService {
  final String collection;

  MyFirestoreService({required this.collection});

  late final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(collection);

  Future<List<Product>> getProducts() async {
    try {
      List<Product> products = [];

      QuerySnapshot _querySnapshot = await _collectionReference.get();
      _querySnapshot.docs.forEach((element) {
        //print(element.id);
        //print(element.data());
        Map<String, dynamic> myMap = element.data() as Map<String, dynamic>;
        //print(myMap);
        Product product = Product.fromJson(myMap);
        product.id = element.id;
        products.add(product);
      });
      //print(products);
      return products;
    } on TimeoutException catch (e) {
      return Future.error("Error internet 1");
    } on SocketException catch (e) {
      return Future.error("Error internet 2");
    } on Error catch (e) {
      return Future.error("Error internet 3");
    }
  }
}
