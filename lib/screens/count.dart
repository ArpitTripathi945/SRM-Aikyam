import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:srmthon/provider/review_cart_provider.dart';

class Count extends StatefulWidget {
  String itemName;
  String itemImage;
  String itemId;
  int itemPrice;

  Count({
    required this.itemName,
    required this.itemId,
    required this.itemImage,
    required this.itemPrice,
  });
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Your Review Cart")
        .doc(widget.itemId)
        .get()
        .then(
          (value) => {
            if (this.mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      count = value.get("cartQuantity");
                      isTrue = value.get("isAdd");
                    })
                  }
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();

    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      reviewCartProvider.reviewCartDataDelete(widget.itemId);
                    } else if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.updateReviewCartData(
                        cartId: widget.itemId,
                        cartImage: widget.itemImage,
                        cartName: widget.itemName,
                        cartPrice: widget.itemPrice,
                        cartQuantity: count,
                      );
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  " $count ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    reviewCartProvider.updateReviewCartData(
                      cartId: widget.itemId,
                      cartImage: widget.itemImage,
                      cartName: widget.itemName,
                      cartPrice: widget.itemPrice,
                      cartQuantity: count,
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.itemId,
                    cartImage: widget.itemImage,
                    cartName: widget.itemName,
                    cartPrice: widget.itemPrice,
                    cartQuantity: count,
                  );
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
    );
  }
}
