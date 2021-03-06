import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/helpers/sp_global.dart';
import 'package:flutter_codigo4_menuapp/models/user_model.dart';
import 'package:flutter_codigo4_menuapp/pages/admin/home_admin_page.dart';
import 'package:flutter_codigo4_menuapp/services/firestore_service.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class LoginAdminPage extends StatefulWidget {
  const LoginAdminPage({Key? key}) : super(key: key);

  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isInvisible = true;
  final _formKey = GlobalKey<FormState>();
  SPGlobal _prefs = SPGlobal();
  MyFirestoreService myUserService = MyFirestoreService(collection: "users");

  _loginEmailPassword() async {
    //print(FirebaseAuth.instance.currentUser);
    /*UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "dafm.10@gmail.com",
      password: "9667921d",
    );*/
    //print(await userCredential.user!.getIdToken());
    //print(userCredential.user);

    try {
      if (_formKey.currentState!.validate()) {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if(userCredential != null){
          String? email = userCredential.user!.email;
          //print(userCredential.user!.email);
          // guardamos un valor en SP cuando nos logueamos como usuario
          _prefs.isAdmin = true;
          UserModel? user = await myUserService.getUserData(email!);
          //print(user!.toJson());
          if(user!.role == "admin"){
            Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeAdminPage()),
            (route) => false);
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "El usuario no existe",
            ),
          ),
        );
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Contrase??a incorrecta",
            ),
          ),
        );
      }
    }
  }

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
                  "Inicio de Sesi??n",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Administrador",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: const [
                    Text(
                      "Correo Electr??nico",
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
                    hintText: "Correo electr??nico",
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
                      return "El campo no puede estar vac??o";
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
                      "Contrase??a",
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
                    hintText: "Contrase??a",
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
                      return "El campo no puede estar vac??o";
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
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: const LinearGradient(
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
                      _loginEmailPassword();
                    },
                    child: const Text(
                      "Iniciar Sesi??on",
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
