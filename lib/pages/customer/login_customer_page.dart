import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/helpers/sp_global.dart';
import 'package:flutter_codigo4_menuapp/models/user_model.dart';
import 'package:flutter_codigo4_menuapp/pages/customer/home_customer_page.dart';
import 'package:flutter_codigo4_menuapp/pages/customer/register_customer_page.dart';
import 'package:flutter_codigo4_menuapp/services/firestore_service.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCustomerPage extends StatefulWidget {
  const LoginCustomerPage({Key? key}) : super(key: key);

  @override
  _LoginCustomerPageState createState() => _LoginCustomerPageState();
}

class _LoginCustomerPageState extends State<LoginCustomerPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isInvisible = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final SPGlobal _prefs = SPGlobal();
  MyFirestoreService myUserService = MyFirestoreService(collection: "users");

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _loginWithEmailPassword() async {
    try {
      if (_formKey.currentState!.validate()) {
        isLoading = true;
        setState(() {});
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential != null) {
          String? email = userCredential.user!.email;
          //print(userCredential.user!.email);
          // guardamos un valor en SP cuando nos logueamos como usuario
          _prefs.isCustomer = true;
          UserModel? user = await myUserService.getUserData(email!);
          //print(user!.toJson());
          if (user!.role == "cliente") {
            isLoading = false;
            setState(() {});
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeCustomerPage()),
                    (route) => false);
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      setState(() {});
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
              "Contraseña incorrecta",
            ),
          ),
        );
      }
    }
  }

  _logiWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount == null) {
      return;
    }

    GoogleSignInAuthentication _googleSignInAuth =
    await googleSignInAccount.authentication;

    OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: _googleSignInAuth.accessToken,
      idToken: _googleSignInAuth.idToken,
    );

    // con esto podemos registrarnos en Authentication
    // Hasta aqui nos permite registrar en Authentication
    UserCredential user =
    await FirebaseAuth.instance.signInWithCredential(credential);

    //Aqui validamos para registrar en FireStor en la colección Users
    if (user.user != null) {
      String? email = user.user!.email;
      // aqui validamos si el email ingresado ya existe
      bool res = await myUserService.checkEmail(email);
      if (!res) {
        UserModel _user = UserModel(
            email: email!, name: user.user!.displayName!, role: "cliente");
        myUserService.addUser(_user).then((value) {
          _prefs.isCustomer = true;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeCustomerPage()),
                  (route) => false);
        });
      }else{
        _prefs.isCustomer = true;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeCustomerPage()),
                (route) => false);
      }
    }

    print(user.user!.email);
    //print(googleSignInAccount.email);
    //print(googleSignInAccount.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0F0E),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
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
                      height: 20.0,
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
                      height: 25.0,
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
                          _loginWithEmailPassword();
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
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _logiWithGoogle();
                        },
                        icon: Image.asset(
                          "assets/images/google.png",
                          height: 24.0,
                        ),
                        label: Text(
                          "Inicio de sesión con Google",
                          style: TextStyle(
                            color: Colors.black87.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _googleSignIn.signOut();
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/bx-facebook.svg",
                          color: Colors.white,
                          height: 20.0,
                        ),
                        label: Text(
                          "Inicio de sesión con Facebook",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff415DaE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Aún no estás registrado?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterCustomerPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Regístrate",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          isLoading
              ? Container(
            color: Colors.white24,
            child: loadingWidget,
          )
              : Container(),
        ],
      ),
    );
  }
}
