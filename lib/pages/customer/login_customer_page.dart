
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/helpers/sp_global.dart';
import 'package:flutter_codigo4_menuapp/services/firestore_service.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class LoginCustomerPage extends StatefulWidget {
  const LoginCustomerPage({Key? key}) : super(key: key);

  @override
  _LoginCustomerPageState createState() => _LoginCustomerPageState();
}

class _LoginCustomerPageState extends State<LoginCustomerPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isInvisible = true;
  final _formKey = GlobalKey<FormState>();
  SPGlobal _prefs = SPGlobal();
  MyFirestoreService myUserService = MyFirestoreService(collection: "users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D0F0E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  "assets/images/logo.jpeg",
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
                const Text(
                  "Inicio de Sesión",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: const [
                    Text(
                      "Correo Electrónico",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Correo electrónico",
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    filled: true,
                    fillColor: Color(0xff2A2A2A),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    Text(
                      "Contraseña",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isInvisible,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    filled: true,
                    fillColor: Color(0xff2A2A2A),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        isInvisible = !isInvisible;
                        setState(() {});
                      },
                      icon: Icon(
                        isInvisible
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFC7345),
                        COLOR_SECONDARY,
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text(
                      "Iniciar Sesiñon",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
