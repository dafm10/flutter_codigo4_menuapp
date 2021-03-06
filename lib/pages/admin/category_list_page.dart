import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/models/category_model.dart';
import 'package:flutter_codigo4_menuapp/services/firestore_service.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/dialog_add_update_form_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/dialog_delete_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/item_list_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryListPage extends StatefulWidget {
  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('categories');

  MyFirestoreService myFirestoreService =
      MyFirestoreService(collection: "categories");

  String idCategory = "";
  bool isLoading = false;
  bool selected = true;

  void _showDeleteItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogDeleteWidget(
          onDelete: () {
            isLoading = true;
            setState(() {});
            deleteItem();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void deleteItem() {
    myFirestoreService.deleteItem(idCategory).then((value) {
      if (value == 1) {
        isLoading = false;
        setState(() {});
        messageSuccessSnackBar(context, "El registro se eliminĂ³ correctamente");
      }
    }).catchError((error) {
      isLoading = false;
      setState(() {});
    });
  }

  void _showAddUpdateItem(Category? category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogAddUpdateFormWidget(
          category: category,
        );
      },
    );
  }

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
        iconTheme: const IconThemeData(
          color: COLOR_BRAND_SECONDARY,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: COLOR_BRAND_SECONDARY,
        onPressed: () {
          _showAddUpdateItem(null);
        },
        child: SvgPicture.asset(
          "assets/icons/plus.svg",
          color: Colors.white,
          height: 26.0,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                                "Categorias",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                "Gestiona las categorĂ­as existentes",
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

                        List<Category> categories = collection.docs.map((e) {
                          Category item = Category.fromJson(
                              e.data() as Map<String, dynamic>);
                          item.id = e.id;
                          return item;
                        }).toList();
                        //print(categories);
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
                            return ItemListWidget(
                              title: categories[index].description,
                              status: categories[index].status,
                              onDelete: () {
                                idCategory = categories[index].id!;
                                _showDeleteItem();
                              },
                              onUpdate: () {
                                _showAddUpdateItem(categories[index]);
                              },
                            );
                          },
                        );
                      }
                      return loadingWidget;
                    },
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
          isLoading
              ? Container(
                  color: Colors.white60,
                  child: loadingWidget,
                )
              : Container(),
        ],
      ),
    );
  }
}
