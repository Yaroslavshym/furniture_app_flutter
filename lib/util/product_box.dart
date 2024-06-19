import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/classes/Furniture.dart';
import 'package:google_fonts/google_fonts.dart';

import '../storage/cloud_management.dart';

class ProductBox extends StatelessWidget {
  final Furniture product;
  const ProductBox({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(mediaQuerySize.height * 0.01),
      width: mediaQuerySize.width * 0.9,
      height: mediaQuerySize.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          FutureBuilder(
            future: getImageURl(product),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              var data = snapshot.data;
              if (snapshot.connectionState == ConnectionState.done &&
                  data != null) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    data,
                    width: mediaQuerySize.width * 0.425,
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return SizedBox(
                    width: mediaQuerySize.width * 0.425,
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    ));
              }
            },
          ),
          SizedBox(
            width: mediaQuerySize.width * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: mediaQuerySize.width * 0.37,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      product.title,
                      // softWrap: true,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: mediaQuerySize.width * 0.035,
                      ),
                    )),
              ),
              SizedBox(height: mediaQuerySize.height * 0.01),
              SizedBox(
                width: mediaQuerySize.width * 0.37,
                child: Text(
                  [product.description.substring(0, 40), '    Read More...']
                      .join(),
                  textAlign: TextAlign.start,
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    backgroundColor: Colors.transparent,
                    fontWeight: FontWeight.w400,
                    fontSize: mediaQuerySize.width * 0.025,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    [
                      '\$',
                      (product.newPrice is num
                              ? product.newPrice
                              : product.price)
                          .toString()
                    ].join(),
                    textAlign: TextAlign.start,
                    style: GoogleFonts.manrope(
                      color:
                          product.newPrice is num ? Colors.green : Colors.black,
                      backgroundColor: Colors.transparent,
                      fontWeight: product.newPrice is num
                          ? FontWeight.w800
                          : FontWeight.w400,
                      fontSize: mediaQuerySize.width * 0.05,
                    ),
                  ),
                  SizedBox(width: mediaQuerySize.width * 0.025),
                  product.newPrice is num
                      ? Text(
                          ['\$', product.price.toString()].join(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.manrope(
                            color: Colors.grey,
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.w800,
                            fontSize: mediaQuerySize.width * 0.035,
                            textStyle: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          )
          // getImageURl(product.imagePath).then((value) {return Image.network(value);}),
        ],
      ),
    );
  }
}
