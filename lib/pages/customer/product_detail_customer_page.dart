import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';

class ProductDetailCustomerPage extends StatelessWidget {
  const ProductDetailCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                      "https://decomidaperuana.com/wp-content/uploads/2020/05/parrilla.jpg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Parrilla Completa",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                  Text(
                    "Origen: Andina",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0
                    ),
                  ),
                  SizedBox(height: 6.0,),
                  lineWidget,
                  SizedBox(height: 6.0,),
                  Text(
                    "Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo Contenido aquí, contenido aquí. Estos textos hacen parecerlo un español que se puede leer. Muchos paquetes de autoedición y editores de páginas web usan el Lorem Ipsum como su texto por defecto, y al hacer una búsqueda de Lorem Ipsum va a dar por resultado muchos sitios web que usan este texto si se encuentran en estado de desarrollo. Muchas versiones han evolucionado a través de los años, algunas veces por accidente, otras veces a propósito (por ejemplo insertándole humor y cosas por el estilo).",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0
                    ),
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
