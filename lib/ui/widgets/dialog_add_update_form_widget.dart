
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class DialogAddUpdateFormWidget extends StatefulWidget {
  const DialogAddUpdateFormWidget({Key? key}) : super(key: key);

  @override
  _DialogAddUpdateFormWidgetState createState() =>
      _DialogAddUpdateFormWidgetState();
}

class _DialogAddUpdateFormWidgetState extends State<DialogAddUpdateFormWidget> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Text(
        "Agregar Categoría",
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
              decoration: InputDecoration(
                hintText: "Descripción",
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
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text("Estado:  "),
              Checkbox(
                value: selected,
                onChanged: (bool? value) {
                  selected = value!;
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Cancelar",
            style: TextStyle(
              color: COLOR_BRAND_SECONDARY.withOpacity(0.6),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Aceptar",
            style: TextStyle(
              color: COLOR_BRAND_SECONDARY,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
