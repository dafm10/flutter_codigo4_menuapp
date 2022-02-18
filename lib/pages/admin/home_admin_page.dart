import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/helpers/sp_global.dart';
import 'package:flutter_codigo4_menuapp/pages/admin/category_list_page.dart';
import 'package:flutter_codigo4_menuapp/pages/admin/login_page.dart';
import 'package:flutter_codigo4_menuapp/pages/admin/product_list_page.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/item_option_admin_widget.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({Key? key}) : super(key: key);

  @override
  _HomeAdminPageState createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {

  final SPGlobal _prefs = SPGlobal();

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              _prefs.isAdmin = false;
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginAdminPage()),
                      (route) => false);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: COLOR_BRAND_SECONDARY,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
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
                          "Bienvenido Admin",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          "Administra todo desde este módulo",
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
              ItemOptionAdminWidget(
                image:
                    "https://images.pexels.com/photos/1565982/pexels-photo-1565982.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                title: "Productos",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListpage(),
                    ),
                  );
                },
              ),
              ItemOptionAdminWidget(
                image:
                    "https://images.pexels.com/photos/326278/pexels-photo-326278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                title: "Categorías",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryListPage(),
                    ),
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
