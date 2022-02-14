import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class ItemFilterCategoryWidget extends StatelessWidget {
  String title;
  bool selected;
  Function onSelected;

  ItemFilterCategoryWidget({
    required this.title,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
          ),
        ),
        selected: selected,
        showCheckmark: false,
        selectedColor: COLOR_BRAND_SECONDARY,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        onSelected: (bool value) {},
      ),
    );
  }
}
