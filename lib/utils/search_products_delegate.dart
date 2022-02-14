import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/models/product_model.dart';
import 'package:flutter_codigo4_menuapp/pages/customer/product_detail_customer_page.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/item_product_search_widget.dart';

class SearchProduct extends SearchDelegate {

  List<Product> products = [];

  SearchProduct({required this.products});

  List<String> names = [
    "Juan",
    "Luis",
    "Carlos",
    "Diana",
    "Susana",
    "María",
    "Alejandra",
    "Mariela",
    "Angela",
  ];

  @override
  String get searchFieldLabel => "Buscar producto";

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Icono "X", para limpiar lo escrito
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // lado izquierdo, icono de retorno
    // captura lo que escribimos
    return IconButton(
      onPressed: () {
        close(context, "");
        //Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Muestra los resultados

    List<Product> aux = products
        .where((element) => element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: aux.length,
      itemBuilder: (conext, index) {
        return ItemProductSearchWidget(
          id: aux[index].id,
          image: aux[index].image,
          name: aux[index].name,
          origin: aux[index].origin,
          description: aux[index].description,
          price: aux[index].price,
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailCustomerPage(
                  product: aux[index],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Muestra las sugerencias
    List<Product> aux = products
        .where((element) => element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: aux.length,
      itemBuilder: (conext, index) {
        return ItemProductSearchWidget(
          id: aux[index].id,
          image: aux[index].image,
          name: aux[index].name,
          origin: aux[index].origin,
          description: aux[index].description,
          price: aux[index].price,
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailCustomerPage(
                  product: aux[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
