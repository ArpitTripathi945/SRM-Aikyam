import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:srmthon/global.dart';
import 'package:srmthon/provider/review_cart_provider.dart';
import 'package:srmthon/screens/count.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String itemImage;
  String itemName;
  int itemPrice;
  String itemId;
  int itemQuantity;
  VoidCallback onDelete;

  SingleItem(
      {required this.itemQuantity,
      required this.itemId,
      required this.onDelete,
      required this.isBool,
      required this.itemImage,
      required this.itemName,
      required this.itemPrice});

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;

  late int count;
  getCount() {
    setState(() {
      count = widget.itemQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 10.0,
          shadowColor: Colors.blueAccent,
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            tileColor: whitecolor,
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(widget.itemImage),
                      fit: BoxFit.cover)),
            ),
            title: Text(
              widget.itemName,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text('\u{20B9}' +
                '${widget.itemPrice}' +
                '\u{00D7}' +
                '${widget.itemQuantity}'),
            trailing: Container(
              height: 90,
              padding: widget.isBool == false
                  ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                  : EdgeInsets.only(left: 15, right: 15),
              child: widget.isBool == false
                  ? Count(
                      itemId: widget.itemId,
                      itemImage: widget.itemImage,
                      itemName: widget.itemName,
                      itemPrice: widget.itemPrice,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: widget.onDelete,
                            child: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // widget.wishList == false
                          //     ? Container(
                          //         height: 25,
                          //         width: 70,
                          //         decoration: BoxDecoration(
                          //           border: Border.all(color: Colors.grey),
                          //           borderRadius: BorderRadius.circular(30),
                          //         ),
                          //         child: Center(
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               InkWell(
                          //                 onTap: () {
                          //                   if (count == 1) {
                          //                     Fluttertoast.showToast(
                          //                       msg:
                          //                           "You reach minimum limit",

                          //                     );
                          //                   } else {
                          //                     setState(() {
                          //                       count--;
                          //                     });
                          //                     reviewCartProvider
                          //                         .updateReviewCartData(
                          //                       cartImage:
                          //                           widget.productImage,
                          //                       cartId: widget.productId,
                          //                       cartName:
                          //                           widget.productName,
                          //                       cartPrice:
                          //                           widget.productPrice,
                          //                       cartQuantity: count,
                          //                     );
                          //                   }
                          //                 },
                          //                 child: Icon(
                          //                   Icons.remove,
                          //                   color: primaryColor,
                          //                   size: 20,
                          //                 ),
                          //               ),
                          //               Text(
                          //                 "$count",
                          //                 style: TextStyle(
                          //                   color: primaryColor,
                          //                 ),
                          //               ),
                          //               InkWell(
                          //                 onTap: () {
                          //                   if (count < 10) {
                          //                     setState(() {
                          //                       count++;
                          //                     });
                          //                     reviewCartProvider
                          //                         .updateReviewCartData(
                          //                       cartImage:
                          //                           widget.productImage,
                          //                       cartId: widget.productId,
                          //                       cartName:
                          //                           widget.productName,
                          //                       cartPrice:
                          //                           widget.productPrice,
                          //                       cartQuantity: count,
                          //                     );
                          //                   }
                          //                 },
                          //                 child: Icon(
                          //                   Icons.add,
                          //                   color: primaryColor,
                          //                   size: 20,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
