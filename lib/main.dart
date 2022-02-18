import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/helpers/sp_global.dart';
import 'package:flutter_codigo4_menuapp/pages/admin/home_admin_page.dart';
import 'package:flutter_codigo4_menuapp/pages/admin/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefs = SPGlobal();
  await prefs.initShared();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Menu App",
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme().apply(),
      ),
      home: PreInit(),
    );
  }
}

class PreInit extends StatelessWidget {

  SPGlobal prefs = SPGlobal();

  @override
  Widget build(BuildContext context) {
    return prefs.isAdmin ? HomeAdminPage() : LoginAdminPage();
  }
}
