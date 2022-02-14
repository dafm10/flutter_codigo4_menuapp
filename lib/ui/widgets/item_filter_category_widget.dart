import 'package:flutter/material.dart';

class ItemFilterCategoryWidget extends StatelessWidget {

  String title;

  ItemFilterCategoryWidget({
    required this.title,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text("todos"),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        onSelected: (bool value) {},
      ),
    );
  }
}
