
import 'package:flutter/material.dart';

class ItemProductSearchWidget extends StatelessWidget {
  const ItemProductSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.07),
            offset: Offset(4,4),
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              "https://t1.rg.ltmcdn.com/es/posts/7/4/1/ceviche_peruano_18147_orig.jpg",
              width: 120.0,
              height: 120.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ceviche",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Origen: Andino",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "https://t1.rg.ltmcdn.com/es/posts/7/4/1/ceviche_peruano_18147_orig.jpg",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "S/. 50.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
