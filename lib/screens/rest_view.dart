import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srmthon/global.dart';
import 'package:srmthon/provider/item_provider.dart';

import 'package:srmthon/screens/item.dart';
import 'package:srmthon/screens/search.dart';

class RestView extends StatefulWidget {
  const RestView({super.key});

  @override
  State<RestView> createState() => _RestViewState();
}

class _RestViewState extends State<RestView> {
  late ItemProvider itemProvider;

  @override
  Widget _buildItem(context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
          children: itemProvider.getItemDataList.map(
        (itemData) {
          return Item(
            itemId: itemData.itemId,
            itemPrice: itemData.itemPrice,
            itemImage: itemData.itemImage,
            itemName: itemData.itemName,
          );
        },
      ).toList()),
    );
  }

  @override
  void initState() {
    ItemProvider initproductProvider = Provider.of(context, listen: false);
    initproductProvider.fetchItemData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemProvider = Provider.of(context);
    return Material(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 195, 201, 215),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 12, 77, 162),
            leading: Icon(Icons.restaurant_rounded),
            title: Text("SRM - Restaurant"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Search(search: itemProvider.getAllItemSearch),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 27,
                  color: whitecolor,
                ),
              ),
              Text("   "),
            ],
          ),
          body: ListView(
            children: [
              _buildItem(context),
            ],
          )),
    );
  }
}
