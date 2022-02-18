
import 'package:flutter/material.dart';

class RegisterCustomerPage extends StatefulWidget {
  const RegisterCustomerPage({Key? key}) : super(key: key);

  @override
  _RegisterCustomerPageState createState() => _RegisterCustomerPageState();
}

class _RegisterCustomerPageState extends State<RegisterCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: Center(),
    );
  }
}
