import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmthon/global.dart';

import 'package:srmthon/models/item_model.dart';
import 'package:srmthon/screens/item.dart';
import 'package:srmthon/screens/single_item.dart';

class Search extends StatefulWidget {
  final List<ItemModel> search;
  Search({required this.search});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  searchItem(String query) {
    List<ItemModel> searchFood = widget.search.where((element) {
      return element.itemName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ItemModel> _searchItem = searchItem(query);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 195, 201, 215),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 77, 162),
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                fillColor: whitecolor,
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((data) {
              return Item(
                //isBool: false,
                itemImage: data.itemImage,
                itemName: data.itemName,
                itemPrice: data.itemPrice,
                itemId: data.itemId,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
