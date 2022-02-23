import 'dart:io';

import 'package:flutter_codigo4_menuapp/models/product_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBGlobal {
  Database? _myDatabase;

  static final DBGlobal db = DBGlobal._();

  DBGlobal._();

  Future<Database?> getDatabase() async {
    if (_myDatabase != null) return _myDatabase;

    _myDatabase = await initDb();
    return _myDatabase;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "MenuApp.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE Product(id TEXT PRIMARY KEY, name TEXT, image TEXT, price REAL, quantity INTEGER)");
      },
    );
  }

  Future<int> insertProduct(Product product) async {
    final db = await getDatabase();
    int res = await db!.insert(
      'Product',
      {
        "id": product.id,
        "name": product.name,
        "image": product.image,
        "price": product.price,
        "quantity": product.quantity,
      },
    );
    print(res);
    return res;
  }

  Future<List<Product>> getProducts() async {
    final db = await getDatabase();
    List<Map<String,dynamic>> res = await db!.query('Product');
    List<Product> products = res.isNotEmpty ? res.map<Product>((e) => Product.fromJson(e)).toList() : [];
    print(products);
    return products;
  }
}
