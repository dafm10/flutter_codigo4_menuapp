import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/text_field_normal_widget.dart';

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
                      backgroundImage: AssetImage("assets/images/logo.jpeg"),
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
              TextFieldNormalwidget(
                hinText: "Nombre",
              ),
              TextFieldNormalwidget(
                hinText: "Descripción",
                maxLines: 4,
              ),
              const SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Categoría :",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: COLOR_BRAND_SECONDARY,
                  ),
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.07),
                      offset: Offset(4,4),
                      blurRadius: 12.0,
                    ),
                  ],
                ),
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: "1",
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Bebidas",
                        ),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Platos de Fondo",
                        ),
                        value: "2",
                      ),
                    ],
                    onChanged: (String? value) {},
                  ),
                ),
              ),
              const SizedBox(height: 10.0,),

              TextFieldNormalwidget(
                hinText: "Origen",
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldNormalwidget(
                      hinText: "Precio",
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: TextFieldNormalwidget(
                      hinText: "Descuento",
                      textInputType: TextInputType.number,
                      maxLength: 3,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldNormalwidget(
                      hinText: "Puntaje",
                      textInputType: TextInputType.number,
                      maxLength: 1,
                    ),
                  ),
                  Expanded(
                    child: TextFieldNormalwidget(
                      hinText: "Tiempo",
                      textInputType: TextInputType.number,
                      maxLength: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
