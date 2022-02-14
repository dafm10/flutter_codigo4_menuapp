
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCategoryListWidget extends StatelessWidget {
  const ItemCategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: COLOR_BRAND_SECONDARY,
        child: Text("B"),
      ),
      title: Text("Bebidas"),
      subtitle: Text("Estado: Activo"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/trash.svg",
              color: COLOR_BRAND_SECONDARY,
              height: 20.0,
            ),
          ),
          IconButton(
            onPressed: () {},
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
