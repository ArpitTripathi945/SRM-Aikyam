import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmthon/global.dart';
import 'package:srmthon/screens/count.dart';

class Item extends StatefulWidget {
  final String itemImage;
  final String itemName;
  final int itemPrice;

  final String itemId;

  Item(
      {required this.itemId,
      required this.itemImage,
      required this.itemName,
      required this.itemPrice});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 10.0,
          shadowColor: Colors.blueAccent,
          clipBehavior: Clip.antiAlias,
          child: ListTile(
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
            subtitle: Text('\u{20B9}' + '${widget.itemPrice}'),
            trailing: Count(
              itemId: widget.itemId,
              itemImage: widget.itemImage,
              itemName: widget.itemName,
              itemPrice: widget.itemPrice,
            ),
            tileColor: whitecolor,
          ),
        ),
      ),
    );

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           Container(
//             margin: EdgeInsets.only(right: 10),
//             height: 230,
//             width: 165,
//             decoration: BoxDecoration(
//               color: Color(0xffd9dad9),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: widget.onTap,
//                   child: Container(
//                     height: 150,
//                     padding: EdgeInsets.all(5),
//                     width: double.infinity,
//                     child: Image.network(
//                       widget.productImage,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.productName,
//                           style: TextStyle(
//                             color: textColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           '${widget.productPrice}\$/${unitData == null?firstValue:unitData}',
//                           style: TextStyle(
//                             color: Colors.grey,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ProductUnit(
//                                 onTap: () {
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (context) {
//                                         return Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: widget
//                                               .productUnit.productUnit
//                                               .map<Widget>((data) {
//                                             return Column(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets
//                                                           .symmetric(
//                                                       vertical: 10,
//                                                       horizontal: 10),
//                                                   child: InkWell(
//                                                     onTap: () async {
//                                                       setState(() {
//                                                         unitData = data;
//                                                       });
//                                                       Navigator.of(context)
//                                                           .pop();
//                                                     },
//                                                     child: Text(
//                                                       data,
//                                                       style: TextStyle(
//                                                           color: primaryColor,
//                                                           fontSize: 18),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             );
//                                           }).toList(),
//                                         );
//                                       });
//                                 },
//                                 title: unitData == null?firstValue:unitData,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Count(
//                               productId: widget.productId,
//                               productImage: widget.productImage,
//                               productName: widget.productName,
//                               productPrice: widget.productPrice,
//                               productUnit: unitData == null?firstValue:unitData,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
  }
}
