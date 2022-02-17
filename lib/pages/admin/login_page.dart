import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginAdminPage extends StatefulWidget {
  const LoginAdminPage({Key? key}) : super(key: key);

  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  _loginEmailPassword()  async{
    //print(FirebaseAuth.instance.currentUser);
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "dafm.10@gmail.com",
      password: "9667921d",
    );
    //print(await userCredential.user!.getIdToken());
    print(userCredential.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _loginEmailPassword();
          },
          child: Text(
            "Login",
          ),
        ),
      ),
    );
  }
}
