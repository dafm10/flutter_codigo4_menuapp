
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class DialogDeleteWidget extends StatelessWidget {

  Function onDelete;

  DialogDeleteWidget({
    required this.onDelete,
});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: COLOR_BRAND_SECONDARY,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: const Text(
        "¿Deseas eliminar este registro?",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      content: const Text(
        "El registro se eliminará permanentemente",
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            "Cancelar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white60,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text(
            "Aceptar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            onDelete();
            /*isLoading = true;
            setState(() {});
            deleteItem();
            Navigator.pop(context);*/
          },
        ),
      ],
    );
  }
}
