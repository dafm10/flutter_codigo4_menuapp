
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class ItemProductSearchWidget extends StatelessWidget {

  String id;
  String image;
  String name;
  String origin;
  String description;
  double price;
  Function onTap;

  ItemProductSearchWidget({
    required this.id,
    required this.image,
    required this.name,
    required this.origin,
    required this.description,
    required this.price,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
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
            Hero(
              tag: id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                /*child: Image.network(
                  image,
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),*/
                child: CachedNetworkImage(
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                  fadeInCurve: Curves.easeIn,
                  fadeInDuration: Duration(milliseconds: 400),
                  progressIndicatorBuilder: (context, url, progress) {
                    return const Center(
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          color: COLOR_BRAND_SECONDARY,
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                  imageUrl: image,
                ),
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
                      name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Origen: $origin",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      description,
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
                    "S/. ${price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
