import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_menuapp/ui/general/colors.dart';

class ItemProductListWidget extends StatelessWidget {
  String image;
  String name;
  String origin;
  String description;
  double price;
  int time;
  int discount;
  Function onTap;

  ItemProductListWidget(
      {required this.name,
      required this.image,
      required this.origin,
      required this.description,
      required this.price,
      required this.time,
      required this.discount,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        //height: _height * 0.38,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: COLOR_PRIMARY.withOpacity(0.06),
              blurRadius: 12.0,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                /*ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: _height * 0.25,
                  ),
                ),*/

                ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    fadeInCurve: Curves.easeIn,
                    fadeInDuration: Duration(milliseconds: 400),
                    progressIndicatorBuilder: (context, url, progress){
                      return Center(child: CircularProgressIndicator(

                      ),);
                    },
                    height: _height * 0.25,
                    width: double.infinity,
                    imageUrl: image,
                  ),
                ),
                // validamos que si el discount es 0, no debe aparecer
                discount > 0
                    ? Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 60.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: COLOR_SECONDARY,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "-${discount}%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: COLOR_PRIMARY,
                          ),
                        ),
                        Text(
                          "Origen: $origin",
                          style: TextStyle(
                            color: COLOR_PRIMARY.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: COLOR_PRIMARY.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "S/. ${price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: COLOR_PRIMARY,
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: COLOR_PRIMARY.withOpacity(0.7),
                            size: 13.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            "$time min.",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: COLOR_PRIMARY.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
