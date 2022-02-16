
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemListWidget extends StatelessWidget {

  String title;
  bool status;
  Function onDelete;
  Function onUpdate;

  ItemListWidget({
    required this.title,
    required this.status,
    required this.onDelete,
    required this.onUpdate,
});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: COLOR_BRAND_SECONDARY,
        child: Text(title[0].toUpperCase()),
      ),
      title: Text(title),
      subtitle: Text(status ? "Estado: Activo" : "Estado: Desactivo"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              onDelete();
            },
            icon: SvgPicture.asset(
              "assets/icons/trash.svg",
              color: COLOR_BRAND_SECONDARY,
              height: 20.0,
            ),
          ),
          IconButton(
            onPressed: () {
              onUpdate();
            },
            icon: SvgPicture.asset(
              "assets/icons/edit.svg",
              color: COLOR_BRAND_SECONDARY,
              height: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
