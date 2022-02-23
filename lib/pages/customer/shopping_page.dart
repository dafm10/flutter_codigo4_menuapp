import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/db/db_global.dart';
import 'package:flutter_codigo4_menuapp/models/product_model.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        /*leading: const SizedBox(
          width: 20.0,
        ),*/
        title: const Text(
          "MenuApp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: COLOR_PRIMARY,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: COLOR_PRIMARY,
        ),
      ),
      body: FutureBuilder(
        future: DBGlobal.db.getProducts(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<Product> products = snap.data;
            return ListView.separated(
              itemCount: products.length,
              separatorBuilder: (_,__)=>Divider(indent: 16.0, endIndent: 16.0,),
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(products[index].name),
                );
              },
            );
          }
          return loadingWidget;
        },
      ),
    );
  }
}
