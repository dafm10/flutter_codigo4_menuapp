
import 'package:flutter/material.dart';

class TextFieldNormal2Widget extends StatelessWidget {

  String hintText;
  TextEditingController controller;

  TextFieldNormal2Widget({
    required this.hintText,
    required this.controller,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:[
            Text(
              hintText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          controller:controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
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
      ],
    );
  }
}
