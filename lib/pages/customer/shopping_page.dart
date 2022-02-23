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
  double total = 0.0;
  String idProduct = "";

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
            total = 0;
            List<Product> products = snap.data;
            products.forEach((element) {
              total += element.price * element.quantity!;
            });
            return products.isNotEmpty
                ? Stack(
                    children: [
                      ListView.separated(
                        itemCount: products.length,
                        separatorBuilder: (_, __) =>
                            const Divider(indent: 16.0, endIndent: 16.0),
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 12.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          products[index].name,
                                          maxLines: 1,
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
                                          onTap: () {
                                            print(products[index].id);
                                            idProduct = products[index].id;
                                            DBGlobal.db
                                                .deleteProduct(idProduct);
                                            setState(() {});
                                          },
                                          child: const Text(
                                            "Eliminar",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
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
                                    Text(
                                        "S/. ${products[index].price.toString()}"),
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
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "S/. ${(products[index].quantity! * products[index].price).toStringAsFixed(2)}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: 0,
                            padding: EdgeInsets.zero,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 10.0),
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFFC7345),
                                    COLOR_SECONDARY,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffFFFC7345).withOpacity(0.4),
                                    blurRadius: 12,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.price_change,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    "Total a pagar: S/. ${total.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/box.png",
                          height: 65.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Aún no hay productos en tu carrito",
                        ),
                      ],
                    ),
                );
          }
          return loadingWidget;
        },
      ),
    );
  }
}
