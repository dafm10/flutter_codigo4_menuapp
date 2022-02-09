import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class ItemProductListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      height: _height * 0.38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: COLOR_PRIMARY.withOpacity(0.06),
            blurRadius: 12.0,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.network(
                  "https://decomidaperuana.com/wp-content/uploads/2020/05/parrilla.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: _height * 0.25,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 60.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: COLOR_SECONDARY,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "-70%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Parrillada Completa",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: COLOR_PRIMARY,
                        ),
                      ),
                      Text(
                        "Origen: Andina",
                        style: TextStyle(
                          color: COLOR_PRIMARY.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas Letraset, las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: COLOR_PRIMARY.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "S/. 50.00",
                      style: TextStyle(
                        color: COLOR_PRIMARY,
                        fontWeight: FontWeight.bold,
                        fontSize: 27.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: COLOR_PRIMARY.withOpacity(0.7),
                          size: 13.0,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          "10 min.",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: COLOR_PRIMARY.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}