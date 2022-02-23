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
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  height: 90,
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              products[index].image,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "Cantidad: ${products[index].quantity}",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              /*GestureDetector(
                                onTap: (){},
                                child: Text(
                                  "Eliminar",
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),*/
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  "Eliminar",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Precio"),
                          Text("S/. ${products[index].price.toString()}"),
                        ],
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Subtot.",
                            style: TextStyle(
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            "S/. ${(products[index].quantity! * products[index].price).toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
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
