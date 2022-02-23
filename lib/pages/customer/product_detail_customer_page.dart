import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/db/db_global.dart';
import 'package:flutter_codigo4_menuapp/models/product_model.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/button_add_remove_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailCustomerPage extends StatefulWidget {
  Product product;

  ProductDetailCustomerPage({required this.product});

  @override
  State<ProductDetailCustomerPage> createState() =>
      _ProductDetailCustomerPageState();
}

class _ProductDetailCustomerPageState extends State<ProductDetailCustomerPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: COLOR_BRAND_SECONDARY,
        ),
      ),*/
      /*floatingActionButton: FloatingActionButton(
        //backgroundColor: const Color(0xff45EF61),
        backgroundColor: const Color(0xff00BB2D),
        onPressed: () async {
          await launch(
              "https://api.whatsapp.com/send?phone=51969461067&text=Quiero%20esta%20parrilla%20");
          //https://api.whatsapp.com/send?phone=51969461067&text=How%20are%20you%20?
        },
        child: SvgPicture.asset(
          "assets/icons/whp.svg",
          color: Colors.white,
          height: 38.0,
        ),
      ),*/
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Container(
              height: _height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    product.image,
                  ),
                ),
              ),
            ),*/
                Hero(
                  tag: widget.product.id!,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    fadeInCurve: Curves.easeIn,
                    fadeInDuration: Duration(milliseconds: 400),
                    progressIndicatorBuilder: (context, url, progress) {
                      return const Center(
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: CircularProgressIndicator(
                            color: COLOR_BRAND_SECONDARY,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                    height: _height * 0.4,
                    width: double.infinity,
                    imageUrl: widget.product.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                                Text(
                                  "Origen: ${widget.product.origin}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0),
                                ),
                                Text(
                                  "Tiempo de preparación: ${widget.product.time} mins.",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Calificación: ${widget.product.rate}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15.0),
                                    ),
                                    const Icon(
                                      Icons.star,
                                      size: 20.0,
                                      color: Color(0xffffb703),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "S/. ${widget.product.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              widget.product.discount > 0
                                  ? Container(
                                      width: 60.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: COLOR_SECONDARY,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "-${widget.product.discount}%",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      lineWidget,
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Ingredientes principales",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // con los 3 puntos concatenamos la lista, ya que
                      // todos los elementos está en una columna
                      ...widget.product.ingredients
                          .map<Widget>(
                            (item) => Text(
                              "- $item",
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                            ),
                          )
                          .toList(),
                      /*Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: product.ingredients
                        .map<Widget>(
                          (item) => Text(
                            "- $item",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            ),
                          ),
                        )
                        .toList(),
                  ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.06),
                    blurRadius: 12.0,
                    offset: const Offset(-4, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      ButtonAddRemoveWidget(
                        icon: Icons.remove,
                        onPressed: () {
                          if (quantity > 1) {
                            quantity--;
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 30.0,
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            color: COLOR_BRAND_SECONDARY,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      ButtonAddRemoveWidget(
                        icon: Icons.add,
                        onPressed: () {
                          quantity++;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        //DBGlobal.db.initDb();
                        Product product = Product(
                          category: "bebidas",
                          image: "sdsdfsdf",
                          rate: 1,
                          price: 22.0,
                          origin: "sdasdasd",
                          name: "Ceviche",
                          ingredients: [],
                          discount: 10,
                          description: "dssdfdsfds",
                          time: 5,
                          status: true,
                          quenatity: 10,
                        );
                        DBGlobal.db.insertProduct(product);
                      },
                      minWidth: 0,
                      padding: EdgeInsets.zero,
                      child: Container(
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
                          children: const [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "Agregar al carrito",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
