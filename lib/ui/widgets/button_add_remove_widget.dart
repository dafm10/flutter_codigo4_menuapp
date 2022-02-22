
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class ButtonAddRemoveWidget extends StatelessWidget {

  IconData icon;
  Function onPressed;

  ButtonAddRemoveWidget({
    required this.icon,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      padding: EdgeInsets.zero,
      minWidth: 0,
      child: Container(
        width: 40.0,
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: COLOR_BRAND_SECONDARY),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
