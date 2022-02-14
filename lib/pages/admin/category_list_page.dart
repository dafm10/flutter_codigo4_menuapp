import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/models/category_model.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/item_category_list_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryListPage extends StatelessWidget {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('categories');

  @override
  Widget build(BuildContext context) {
    /*collectionReference.get().then((value){
      value.docs.forEach((element) {
        print(element.data());
      });
    });*/

    //print(collectionReference.snapshots());

    //print(collectionReference.snapshots().map((event) => event.docs));

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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: COLOR_BRAND_SECONDARY,
        onPressed: () {},
        child: SvgPicture.asset(
          "assets/icons/plus.svg",
          color: Colors.white,
          height: 26.0,
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
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/logo.jpeg"),
                      radius: 25.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Categorias",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            "Gestiona las categorías existentes",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: COLOR_PRIMARY.withOpacity(0.6),
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
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
              StreamBuilder(
                stream: collectionReference.snapshots(),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    QuerySnapshot collection = snap.data;
                    /*List<Category> categories = collection.docs.map(
                      (e) {
                        Category item =
                            Category.fromJson(e.data() as Map<String, dynamic>);
                        item.id = e.id;
                        return item;
                      },
                    ).toList();*/

                    List<Category> categories =  collection.docs.map((e) {
                      Category item = Category.fromJson(e.data() as Map<String, dynamic>);
                      item.id = e.id;
                      return item;
                    } ).toList();
                    print(categories);

                    //print(categories[0].id);
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      // aqui agregamos un separador
                      //separatorBuilder: (BuildContext context, int index) => Divider(),
                      // colocamos los guiones segun los parametros, cuando no usamos context ni index
                      separatorBuilder: (_, __) => Divider(
                        thickness: 0.8,
                        indent: _width * 0.07,
                        endIndent: _width * 0.07,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCategoryListWidget();
                      },
                    );
                  }
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
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
