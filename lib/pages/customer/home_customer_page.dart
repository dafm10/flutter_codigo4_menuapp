import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/models/product_model.dart';
import 'package:flutter_codigo4_menuapp/pages/customer/product_detail_customer_page.dart';
import 'package:flutter_codigo4_menuapp/services/firestore_service.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/item_product_list_widget.dart';

class HomeCustomerPage extends StatefulWidget {
  const HomeCustomerPage({Key? key}) : super(key: key);

  @override
  State<HomeCustomerPage> createState() => _HomeCustomerPageState();
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {
  MyFirestoreService _myFirestoreService =
      MyFirestoreService(collection: "products");

  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myFirestoreService.getProducts().then((value) {
      products = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: COLOR_PRIMARY,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                          "Bienvenido!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          "Descubre los mejores platos que tenemos para tí",
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
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Categorías",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Text("Todos"),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        onSelected: (bool value) {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Text("Postres"),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        onSelected: (bool value) {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Text("Platos de fondo"),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        onSelected: (bool value) {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Text("Bebidas"),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        onSelected: (bool value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Populares",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index){
                  return ItemProductListWidget(
                    name: products[index].name,
                    image: products[index].image,
                    origin: products[index].origin,
                    description: products[index].description,
                    price: products[index].price,
                    time: products[index].time,
                    discount: products[index].discount,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailCustomerPage(
                            product: products[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
