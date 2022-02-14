import 'package:flutter/material.dart';

class SearchProduct extends SearchDelegate {

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

    List<String> aux = names.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: aux.length,
      itemBuilder: (conext, index){
        return ListTile(
          title: Text(aux[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Muestra las sugerencias
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (conext, index){
        return ListTile(
          title: Text(names[index]),
        );
      },
    );
  }
}
