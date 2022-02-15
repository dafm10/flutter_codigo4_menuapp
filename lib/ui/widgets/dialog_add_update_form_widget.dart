
import 'package:flutter/material.dart';

class DialogAddUpdateFormWidget extends StatefulWidget {
  const DialogAddUpdateFormWidget({Key? key}) : super(key: key);

  @override
  _DialogAddUpdateFormWidgetState createState() => _DialogAddUpdateFormWidgetState();
}

class _DialogAddUpdateFormWidgetState extends State<DialogAddUpdateFormWidget> {

  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Agregar Categoría",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Descripción",
            ),
          ),
          SizedBox(height: 10.0,),
          Row(
            children: [
              Text("Estado:  "),
              Checkbox(
                value: selected,
                onChanged: (bool? value) {
                  selected = value!;
                  setState(() {

                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
