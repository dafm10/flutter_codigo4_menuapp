import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/models/product_model.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailCustomerPage extends StatelessWidget {
  Product product;

  ProductDetailCustomerPage({required this.product});

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: _height * 0.40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    product.image,
                  ),
                ),
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
                              product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22.0),
                            ),
                            Text(
                              "Origen: ${product.origin}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0),
                            ),
                            Text(
                              "Tiempo de preparación: ${product.time} mins.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Calificación: ${product.rate}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.0),
                                ),
                                Icon(
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
                            "S/. ${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          product.discount > 0
                              ? Container(
                                  width: 60.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: COLOR_SECONDARY,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-${product.discount}%",
                                    style: TextStyle(
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
                    product.description,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Ingredientes principales",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
