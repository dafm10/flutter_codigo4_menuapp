import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/models/product_model.dart';
import 'package:flutter_codigo4_menuapp/pages/admin/product_add_update_page.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/item_list_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListpage extends StatefulWidget {
  const ProductListpage({Key? key}) : super(key: key);

  @override
  _ProductListpageState createState() => _ProductListpageState();
}

class _ProductListpageState extends State<ProductListpage> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('products');

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: COLOR_BRAND_SECONDARY,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductAddUpdatePage()));
        },
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
                            "Productos",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            "Gestiona los productos existentes",
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
                stream: collectionReference.orderBy('name').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    QuerySnapshot collection = snap.data;

                    List<Product> products = collection.docs.map((e) {
                      Product item =
                          Product.fromJson(e.data() as Map<String, dynamic>);
                      item.id = e.id;
                      return item;
                    }).toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemListWidget(
                          title: products[index].name,
                          status: products[index].status,
                          onDelete: () {},
                          onUpdate: () {},
                        );
                      },
                    );
                  }
                  return loadingWidget;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
