
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

Container lineWidget = Container(
  width: 100,
  height: 3.5,
  decoration: BoxDecoration(
    color: COLOR_SECONDARY,
    borderRadius: BorderRadius.circular(10.0),
  ),
);

Center loadingWidget = const Center(
  child: SizedBox(
    height: 20.0,
    width: 20.0,
    child: CircularProgressIndicator(
      color: COLOR_BRAND_SECONDARY,
      strokeWidth: 2,
    ),
  ),
);

messageSuccessSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: COLOR_BRAND_SECONDARY,
      content: Row(
        children: const [
          Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "El registro se eliminó correctamente",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}