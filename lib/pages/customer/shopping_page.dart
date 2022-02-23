
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
          "Carrito de compras",
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
              separatorBuilder: (_, __) =>
              const Divider(indent: 16.0, endIndent: 16.0),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://comidasperuanas.net/wp-content/uploads/2015/09/Arroz-con-pato.jpg",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              products[index].name,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 4.0,),
                            Text(
                              "Cantidad: ${products[index].quantity}",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
