import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_codigo4_menuapp/models/category_model.dart';
import 'package:flutter_codigo4_menuapp/models/product_model.dart';
import 'package:flutter_codigo4_menuapp/models/user_model.dart';

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

  Future<List<Category>> getCategories()async{
    try{
      List<Category> categories = [];
      QuerySnapshot _querySnapshot = await _collectionReference.get();
      _querySnapshot.docs.forEach((element) {
        Map<String, dynamic> myMap = element.data() as Map<String, dynamic>;
        Category category = Category.fromJson(myMap);
        category.id = element.id;
        categories.add(category);
      });
      return categories;
    }on TimeoutException catch (e) {
      return Future.error("Error internet 1");
    } on SocketException catch (e) {
      return Future.error("Error internet 2");
    } on Error catch (e) {
      return Future.error("Error internet 3");
    }
  }

  Future<int> deleteItem(String id) async {
    try{
      await _collectionReference.doc(id).delete();
      return 1;
    }on TimeoutException catch (e) {
      return Future.error("Error internet 1");
    } on SocketException catch (e) {
      return Future.error("Error internet 2");
    } on Error catch (e) {
      return Future.error("Error internet 3");
    }
  }
  
  Future<String> addCategory(Category category) async {
    try{
     DocumentReference documentReference = await _collectionReference.add(category.toJson());
     return documentReference.id;
    }on TimeoutException catch (e) {
      return Future.error("Error internet 1");
    } on SocketException catch (e) {
      return Future.error("Error internet 2");
    } on Error catch (e) {
      return Future.error("Error internet 3");
    }
  }

  Future<String> updateCategory(Category category) async {
    try{
     await _collectionReference.doc(category.id).update(category.toJson());
     return category.id!;
    }on TimeoutException catch (e) {
      return Future.error("Error internet 1");
    } on SocketException catch (e) {
      return Future.error("Error internet 2");
    } on Error catch (e) {
      return Future.error("Error internet 3");
    }
  }

  Future addProduct(Product product) async {
    try{
      DocumentReference documentReference = await _collectionReference.add(product.toJson());
      return documentReference.id;
    }on TimeoutException catch (e) {
      return Future.error("Error internet 1");
    } on SocketException catch (e) {
      return Future.error("Error internet 2");
    } on Error catch (e) {
      return Future.error("Error internet 3");
    }
  }

  Future<String> updateProduct(Product product) async {
    try{
      await _collectionReference.doc(product.id).update(product.toJson());
      return product.id!;
    } on TimeoutException catch (e) {
      return Future.error("error internet 1");
    } on SocketException catch (e) {
      return Future.error("error internet 2");
    } on Error catch (e) {
      return Future.error("error internet 3");
    }
  }

  Future<UserModel?> getUserData(String email) async {
    QuerySnapshot collection = await _collectionReference.where('email', isEqualTo: email).get();
    if(collection.docs.isNotEmpty){
      Map<String, dynamic> myMap = collection.docs.first.data() as Map<String, dynamic>;
      UserModel user = UserModel.fromJson(myMap);
      //print(user.toJson());
      return user;
    }
  }

}
