import 'package:flutter/material.dart';

class ItemOptionAdminWidget extends StatelessWidget {
  const ItemOptionAdminWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 12.0,
            color: Colors.black87.withOpacity(0.07),
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://images.pexels.com/photos/3850838/pexels-photo-3850838.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
          ),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Productos",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
