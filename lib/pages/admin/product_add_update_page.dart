
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';

class ProductAddUpdatePage extends StatefulWidget {
  const ProductAddUpdatePage({Key? key}) : super(key: key);

  @override
  _ProductAddUpdatePageState createState() => _ProductAddUpdatePageState();
}

class _ProductAddUpdatePageState extends State<ProductAddUpdatePage> {

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

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
          color: COLOR_BRAND_SECONDARY,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                      AssetImage("assets/images/logo.jpeg"),
                      radius: 25.0,
                    ),
                    SizedBox(
                      width: _width * 0.03,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Agregar Producto",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            "Ingresa los siguientes datos por favor",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: COLOR_PRIMARY.withOpacity(0.6),
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            height: _height * 0.011,
                          ),
                          lineWidget,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
