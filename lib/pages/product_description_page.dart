import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_app_flutter/classes/Furniture.dart';
import 'package:furniture_app_flutter/storage/cloud_management.dart';
import 'package:furniture_app_flutter/util/image_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/button_add_to_cart.dart';

class _CustomBouncingScrollPhysics extends ClampingScrollPhysics {
  @override
  SpringDescription get spring => const SpringDescription(
        mass: 100,
        stiffness: 100,
        damping: 10,
      );
}

class ProductDescriptionPage extends StatefulWidget {
  final Furniture product;
  const ProductDescriptionPage({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDescriptionPage> createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  late ImageProvider _imageFuture;

  @override
  void initState() {
    super.initState();
    getProductImage(widget.product).then((value) {
      _imageFuture = value;
    });
  }

  Future<ImageProvider> getProductImage(Furniture product) async {
    String url = await getImageURl(product);
    return NetworkImage(url);
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // background image
          Positioned(
            top: 0,
            // height: mediaQuerySize.height * 0.6,
            child: FutureBuilder(
              future: getProductImage(widget.product),
              builder: (BuildContext context,
                  AsyncSnapshot<ImageProvider> snapshot) {
                ImageProvider? data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done &&
                    data != null) {
                  return Container(
                    height: mediaQuerySize.height * 0.65,
                    width: mediaQuerySize.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: data,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: mediaQuerySize.height * 0.65,
                    width: mediaQuerySize.width,
                    child: const CircularProgressIndicator(color: Colors.black),
                  );
                }
              },
            ),
          ),

          // slidable card
          Positioned(
            // top: 0,
            // height: double.,
            // width: mediaQuerySize.width,
            //
            // box to hold everything in positioned
            child: Container(
              color: Colors.transparent,
              // height: mediaQuerySize.height,
              width: mediaQuerySize.width,
              // list of card
              child: ListView(
                // physics: const ClampingScrollPhysics(),
                physics: _CustomBouncingScrollPhysics(),
                children: [
                  // for leaving space for image
                  SizedBox(
                    height: mediaQuerySize.height * 0.55,
                  ),
                  // black card
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25))),
                    // height: mediaQuerySize.height * 2.5,
                    width: mediaQuerySize.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaQuerySize.height * 0.1,
                          width: mediaQuerySize.width * 0.8,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // price sub-row
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      [
                                        '\$',
                                        (widget.product.newPrice is num
                                                ? widget.product.newPrice
                                                : widget.product.price)
                                            .toString()
                                      ].join(),
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.manrope(
                                        color: Colors.white,
                                        backgroundColor: Colors.transparent,
                                        fontWeight: FontWeight.w700,
                                        fontSize: mediaQuerySize.width * 0.05,
                                      ),
                                    ),
                                    SizedBox(
                                        width: mediaQuerySize.width * 0.025),
                                    widget.product.newPrice is num
                                        ? Text(
                                            [
                                              '\$',
                                              widget.product.price.toString()
                                            ].join(),
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.manrope(
                                              color: Colors.white,
                                              backgroundColor:
                                                  Colors.transparent,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  mediaQuerySize.width * 0.035,
                                              textStyle: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor: Colors.white,
                                                  decorationThickness: 5),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                                // button add to cart
                                ButtonAddToCart(
                                  onTap: () {},
                                  text: 'Add To Cart',
                                )
                              ],
                            ),
                          ),
                        ),

                        // white card
                        Container(
                          // height: double.,
                          width: mediaQuerySize.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: mediaQuerySize.width * 0.05,
                            vertical: mediaQuerySize.height * 0.04,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: mediaQuerySize.width * 0.05,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.product.rating.toString(),
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.manrope(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: mediaQuerySize.width * 0.05,
                                    ),
                                  ),
                                  SizedBox(width: mediaQuerySize.width * 0.01),
                                  //full stars
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    allowHalfRating: true,
                                    initialRating:
                                        widget.product.rating.toDouble(),
                                    itemCount: widget.product.rating
                                        .toDouble()
                                        .round(),
                                    itemSize: mediaQuerySize.height * 0.025,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {});
                                    },
                                  ),
                                  //empty stars
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    allowHalfRating: true,
                                    initialRating:
                                        5 - widget.product.rating.toDouble(),
                                    itemCount: 5 -
                                        widget.product.rating
                                            .toDouble()
                                            .round(),
                                    itemSize: mediaQuerySize.height * 0.025,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_outline_rounded,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                widget.product.description,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                  color: Colors.black,
                                  backgroundColor: Colors.transparent,
                                  fontWeight: FontWeight.w400,
                                  fontSize: mediaQuerySize.width * 0.04,
                                ),
                              ),
                            ],
                          ),

                          // Text(
                          //
                          //   style: TextStyle(fontSize: 16),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // app Bar
          Positioned(
              height: mediaQuerySize.height * 0.2,
              child: FittedBox(
                fit: BoxFit.fill,
                child: AppBar(
                  backgroundColor: Colors.red,
                  actions: const [
                    Center(
                      child: MyImageButton(
                        imagePath: 'lib/images/icons/heart_outlined.png',
                        imageScale: 3,
                        buttonHeight: 45,
                        buttonWidth: 45,
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  ],
                ),
              ),),
        ],
      ),
    );
  }
  // return Scaffold(
//   backgroundColor: Colors.black,
//   body: NestedScrollView(
//     headerSliverBuilder: (context, innerBoxIsScrolled) {
//       return [
//         SliverAppBar(
//           actions: const [],
//           // leading: ,
//           // pinned: true,
//           floating: true,
//           automaticallyImplyLeading: true,
//           expandedHeight: MediaQuery.of(context).size.height * 0.55,
//           collapsedHeight: MediaQuery.of(context).size.height * 0.1,
//           backgroundColor: Colors.transparent,
//           // snap: true,
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(mediaQuerySize.height * 0.5),
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: mediaQuerySize.width * 0.05,
//                 // vertical: mediaQuerySize.height * 0.05,
//               ),
//               height: mediaQuerySize.height * 0.09,
//               decoration: const BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//               ),
//               width: double.maxFinite,
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // price sub-row
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           [
//                             '\$',
//                             (widget.product.newPrice is num
//                                     ? widget.product.newPrice
//                                     : widget.product.price)
//                                 .toString()
//                           ].join(),
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.manrope(
//                             color: Colors.white,
//                             backgroundColor: Colors.transparent,
//                             fontWeight: FontWeight.w700,
//                             fontSize: mediaQuerySize.width * 0.05,
//                           ),
//                         ),
//                         SizedBox(width: mediaQuerySize.width * 0.025),
//                         widget.product.newPrice is num
//                             ? Text(
//                                 ['\$', widget.product.price.toString()]
//                                     .join(),
//                                 textAlign: TextAlign.start,
//                                 style: GoogleFonts.manrope(
//                                   color: Colors.white,
//                                   backgroundColor: Colors.transparent,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: mediaQuerySize.width * 0.035,
//                                   textStyle: const TextStyle(
//                                       decoration:
//                                           TextDecoration.lineThrough,
//                                       decorationColor: Colors.white,
//                                       decorationThickness: 5),
//                                 ),
//                               )
//                             : const SizedBox(),
//                       ],
//                     ),
//                     // button add to cart
//                     ButtonAddToCart(
//                       onTap: () {},
//                       text: 'Add To Cart',
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           flexibleSpace: FutureBuilder(
//             future: _imageFuture,
//             builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
//               if (snapshot.connectionState == ConnectionState.done &&
//                   snapshot.hasData) {
//                 return FlexibleSpaceBar(
//                   background: snapshot.data,
//                 );
//               } else {
//                 return Container(
//                   color: Colors.black,
//                   child: const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ];
//     },
//     body: SingleChildScrollView(
//       // clipBehavior: Clip.none,
//       child: Column(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(15),
//                 topLeft: Radius.circular(15),
//               ),
//             ),
//             padding: EdgeInsets.symmetric(
//               horizontal: mediaQuerySize.width * 0.05,
//               vertical: mediaQuerySize.height * 0.04,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.product.title,
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.manrope(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w900,
//                     fontSize: mediaQuerySize.width * 0.05,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       widget.product.rating.toString(),
//                       textAlign: TextAlign.start,
//                       style: GoogleFonts.manrope(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w900,
//                         fontSize: mediaQuerySize.width * 0.05,
//                       ),
//                     ),
//                     SizedBox(width: mediaQuerySize.width * 0.01),
//                     //full stars
//                     RatingBar.builder(
//                       ignoreGestures: true,
//                       allowHalfRating: true,
//                       initialRating: widget.product.rating.toDouble(),
//                       itemCount: widget.product.rating.toDouble().round(),
//                       itemSize: mediaQuerySize.height * 0.025,
//                       itemBuilder: (context, _) => const Icon(
//                         Icons.star_rounded,
//                         color: Colors.amber,
//                       ),
//                       onRatingUpdate: (rating) {
//                         setState(() {});
//                       },
//                     ),
//                     //empty stars
//                     RatingBar.builder(
//                       ignoreGestures: true,
//                       allowHalfRating: true,
//                       initialRating: 5 - widget.product.rating.toDouble(),
//                       itemCount:
//                           5 - widget.product.rating.toDouble().round(),
//                       itemSize: mediaQuerySize.height * 0.025,
//                       itemBuilder: (context, _) => const Icon(
//                         Icons.star_outline_rounded,
//                         color: Colors.amber,
//                       ),
//                       onRatingUpdate: (rating) {
//                         setState(() {});
//                       },
//                     ),
//                   ],
//                 ),
//                 Text(
//                   widget.product.description,
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.manrope(
//                     color: Colors.black,
//                     backgroundColor: Colors.transparent,
//                     fontWeight: FontWeight.w400,
//                     fontSize: mediaQuerySize.width * 0.04,
//                   ),
//                 ),
//               ],
//             ),
//
//             // Text(
//             //
//             //   style: TextStyle(fontSize: 16),
//             // ),
//           ),
//         ],
//       ),
//     ),
//   ),
// );
}
