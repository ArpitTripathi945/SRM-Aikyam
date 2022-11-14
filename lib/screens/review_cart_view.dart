import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:srmthon/global.dart';
import 'package:srmthon/models/review_item_model.dart';
import 'package:srmthon/provider/review_cart_provider.dart';
import 'package:srmthon/screens/order_cnfrm.dart';
import 'package:srmthon/screens/single_item.dart';

class ReviewCartView extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;
  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you sure? "),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 201, 215),
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.inter().fontFamily),
        ),
        subtitle: Text(
          '\u{20B9}' + '${reviewCartProvider.getTotalPrice()}',
          style: TextStyle(color: Colors.green[900], fontSize: 16),
        ),
        trailing: Container(
          height: 40,
          width: 140,
          child: MaterialButton(
            child: Text(
              "Order",
              style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: whitecolor,
                  fontWeight: FontWeight.bold),
            ),
            color: Color.fromARGB(255, 2, 4, 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () {
              // if(reviewCartProvider.getReviewCartDataList.isEmpty){
              //   return Fluttertoast.showToast(msg: "No Cart Data Found");
              // }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderCnfrm(),
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 77, 162),
        title: Text(
          "Your Cart",
        ),
        leading: Icon(Icons.shopping_cart),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Image.asset("assets/cart.png"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      itemImage: data.cartImage,
                      itemName: data.cartName,
                      itemPrice: data.cartPrice,
                      itemId: data.cartId,
                      itemQuantity: data.cartQuantity,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
