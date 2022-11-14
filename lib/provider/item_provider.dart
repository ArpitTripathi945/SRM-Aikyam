import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:srmthon/models/item_model.dart';

class ItemProvider with ChangeNotifier {
  late ItemModel itemModel;

  List<ItemModel> search = [];
  itemModels(QueryDocumentSnapshot element) {
    itemModel = ItemModel(
      itemImage: element.get("itemImage"),
      itemName: element.get("itemName"),
      itemPrice: element.get("itemPrice"),
      itemId: element.get("itemId"),
    );
    search.add(itemModel);
  }

  //all items data
  List<ItemModel> newItemList = [];

  fetchItemData() async {
    List<ItemModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("hmenu").get();

    value.docs.forEach(
      (element) {
        itemModels(element);

        newList.add(itemModel);
      },
    );
    newItemList = newList;
    notifyListeners();
  }

  List<ItemModel> get getItemDataList {
    return newItemList;
  }

  List<ItemModel> get getAllItemSearch {
    return search;
  }
}
