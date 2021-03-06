import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class TextFieldNormalwidget extends StatelessWidget {
  String hinText;
  int? maxLines;
  TextInputType? textInputType;
  int? maxLength;
  TextEditingController? controller;
  bool? validator;

  TextFieldNormalwidget({
    required this.hinText,
    this.maxLines,
    this.textInputType,
    this.maxLength,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$hinText :",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: COLOR_BRAND_SECONDARY,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Container(
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
              controller: controller,
              maxLines: maxLines,
              keyboardType: textInputType,
              maxLength: maxLength,
              decoration: InputDecoration(
                counterText: "",
                hintText: hinText,
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
                if(validator != null) return null;

                if (value!.isEmpty) {
                  return "El campo no puede estar vac??o";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
