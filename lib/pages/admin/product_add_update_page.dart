import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/models/category_model.dart';
import 'package:flutter_codigo4_menuapp/services/firestore_service.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/general_widget.dart';
import 'package:flutter_codigo4_menuapp/ui/widgets/text_field_normal_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddUpdatePage extends StatefulWidget {
  const ProductAddUpdatePage({Key? key}) : super(key: key);

  @override
  _ProductAddUpdatePageState createState() => _ProductAddUpdatePageState();
}

class _ProductAddUpdatePageState extends State<ProductAddUpdatePage> {
  bool selectedStatus = true;
  final ImagePicker _picker = ImagePicker();
  XFile? imageProduct;

  final _keyForm = GlobalKey<FormState>();

  final TextEditingController _addIngredientsController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final MyFirestoreService _myFirestoreService =
      MyFirestoreService(collection: "categories");

  // Creamos la instancia de Firebase Storage
  firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  List<String> ingredients = [];
  List<Category> categories = [];
  String idCategory = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myFirestoreService.getCategories().then((value) {
      categories = value;
      idCategory = categories[0].id!;
      setState(() {});
    });
  }

  getImageGallery() async {
    XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    imageProduct = selectedImage;
    setState(() {});
  }

  getImageCamera() async {
    XFile? _selectedImage = await _picker.pickImage(source: ImageSource.camera);
    imageProduct = _selectedImage;
    setState(() {});
  }

  uploadImageFirebase() async {
    // creamos la referencia a una carpeta que vamos a crear
    //Estamos referenciando que vamos a crear una carpeta Products para subir las imagenes
    firebase_storage.Reference _reference = _storage.ref().child("products");
    String time = DateTime.now().toString();
    firebase_storage.TaskSnapshot upload =
        await _reference.child("m$time.jpg").putFile(File(imageProduct!.path));
    String url = await upload.ref.getDownloadURL();
  }

  addProduct() {
    if (_keyForm.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "MenuApp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: COLOR_PRIMARY,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: COLOR_BRAND_SECONDARY,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo.jpeg"),
                        radius: 25.0,
                      ),
                      SizedBox(
                        width: _width * 0.03,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Agregar Producto",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              "Ingresa los siguientes datos por favor",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: COLOR_PRIMARY.withOpacity(0.6),
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.011,
                            ),
                            lineWidget,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFieldNormalwidget(
                  hinText: "Nombre",
                  controller: _nameController,
                ),
                TextFieldNormalwidget(
                  hinText: "Descripción",
                  maxLines: 4,
                  controller: _descriptionController,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Categoría :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: COLOR_BRAND_SECONDARY,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.07),
                        offset: const Offset(4, 4),
                        blurRadius: 12.0,
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: idCategory,
                      items: categories
                          .map((e) => DropdownMenuItem(
                                child: Text(e.description),
                                value: e.id,
                              ))
                          .toList(),
                      /*items: [
                        DropdownMenuItem(
                          child: Text(
                            "Bebidas",
                          ),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Platos de Fondo",
                          ),
                          value: "2",
                        ),
                      ],*/
                      onChanged: (String? value) {
                        idCategory = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFieldNormalwidget(
                  hinText: "Origen",
                  controller: _originController,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldNormalwidget(
                        hinText: "Precio",
                        textInputType: TextInputType.number,
                        controller: _priceController,
                      ),
                    ),
                    Expanded(
                      child: TextFieldNormalwidget(
                        hinText: "Descuento",
                        textInputType: TextInputType.number,
                        maxLength: 3,
                        controller: _discountController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldNormalwidget(
                        hinText: "Puntaje",
                        textInputType: TextInputType.number,
                        maxLength: 1,
                        controller: _rateController,
                      ),
                    ),
                    Expanded(
                      child: TextFieldNormalwidget(
                        hinText: "Tiempo",
                        textInputType: TextInputType.number,
                        maxLength: 2,
                        controller: _timeController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldNormalwidget(
                        hinText: "Ingredientes",
                        controller: _addIngredientsController,
                        validator: false,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ingredients.add(_addIngredientsController.text);
                        _addIngredientsController.clear();
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 22.0, right: 16.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: COLOR_SECONDARY,
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xffFC7345), COLOR_SECONDARY],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffFC7345).withOpacity(0.1),
                              blurRadius: 12.0,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/plus.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  height: 300.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.07),
                        blurRadius: 12.0,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: ingredients.isNotEmpty
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: ingredients.length,
                          separatorBuilder: (_, __) => const Divider(
                            indent: 16.0,
                            endIndent: 16.0,
                          ),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                ingredients[index],
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  ingredients.removeAt(index);
                                  setState(() {});
                                },
                                icon: SvgPicture.asset(
                                  "assets/icons/trash.svg",
                                  height: 18.0,
                                ),
                              ),
                            );
                          },
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/box.png",
                              height: 65.0,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "No hay ingredientes registrados",
                            ),
                          ],
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Imagen",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: COLOR_BRAND_SECONDARY,
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(
                              Icons.image,
                              size: 17.0,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              primary: const Color(0xFFFC7345),
                            ),
                            onPressed: () {
                              getImageGallery();
                            },
                            label: const Text("Galería"),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(
                              Icons.camera,
                              size: 17.0,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              primary: const Color(0xFFFC7345),
                            ),
                            onPressed: () {
                              getImageCamera();
                            },
                            label: const Text("Cámara"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                imageProduct != null
                    ? Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.07),
                              offset: Offset(4, 4),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.file(
                            File(
                              imageProduct!.path,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.07),
                              offset: Offset(4, 4),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/image.png",
                              height: 50.0,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "No hay una imagen seleccionada",
                            ),
                          ],
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Text(
                        "Estado",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: COLOR_BRAND_SECONDARY,
                        ),
                      ),
                      Checkbox(
                        value: selectedStatus,
                        activeColor: COLOR_SECONDARY,
                        onChanged: (value) {
                          selectedStatus = value!;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.save,
                      size: 17.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: const Color(0xFFFC7345),
                    ),
                    onPressed: () {
                      addProduct();
                      //uploadImageFirebase();
                    },
                    label: const Text(
                      "Guardar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
