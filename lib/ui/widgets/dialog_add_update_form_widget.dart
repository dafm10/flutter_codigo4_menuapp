import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/models/category_model.dart';
import 'package:flutter_codigo4_menuapp/services/firestore_service.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class DialogAddUpdateFormWidget extends StatefulWidget {
  Category? category;

  DialogAddUpdateFormWidget({
    this.category,
  });

  @override
  _DialogAddUpdateFormWidgetState createState() =>
      _DialogAddUpdateFormWidgetState();
}

class _DialogAddUpdateFormWidgetState extends State<DialogAddUpdateFormWidget> {
  bool selected = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _descriptionController = TextEditingController();
  MyFirestoreService _myFirestoreService =
      MyFirestoreService(collection: "categories");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.category != null) {
      _descriptionController.text = widget.category!.description;
      selected = widget.category!.status;
    }
    ;
  }

  _addUpdateCategory() {
    if (_formKey.currentState!.validate()) {
      Category category = Category(
        description: _descriptionController.text,
        status: selected,
      );

      if (widget.category == null) {
        _myFirestoreService.addCategory(category);
      } else {
        category.id = widget.category!.id;
        _myFirestoreService.updateCategory(category);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Text(
        widget.category == null ? "Agregar Categoría" : "Editar Categoría",
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Form(
        key: _formKey,
        child: Column(
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
                controller: _descriptionController,
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
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text(
                  "Estado:  ",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
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
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancelar",
            style: TextStyle(
              color: COLOR_BRAND_SECONDARY.withOpacity(0.6),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            _addUpdateCategory();
            Navigator.pop(context);
          },
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
