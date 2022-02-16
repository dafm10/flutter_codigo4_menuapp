
import 'package:flutter/material.dart';

class TextFieldNormalwidget extends StatelessWidget {
  const TextFieldNormalwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.08),
            blurRadius: 12.0,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: TextFormField(
        //controller: _descriptionController,
        decoration: InputDecoration(
          hintText: "Descripción",
          hintStyle: const TextStyle(
            fontSize: 14.0,
          ),
          filled: true,
          fillColor: Colors.white,
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
    );
  }
}
