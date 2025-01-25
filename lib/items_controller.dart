import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roulette/models.dart';
import 'package:uuid/uuid.dart';

final itemsControllerProvider =
    StateNotifierProvider<ItemsController, List<Item>>(
        (ref) => ItemsController());

final items = [
  Item(
    id: Uuid().v4(),
    title: "-73 kg",
  ),
  Item(
    id: Uuid().v4(),
    title: "-57 kg",
  ),
  Item(
    id: Uuid().v4(),
    title: "-90 kg",
  ),
  Item(
    id: Uuid().v4(),
    title: "+70 kg",
  ),
  Item(
    id: Uuid().v4(),
    title: "+90 kg",
  ),
  Item(
    id: Uuid().v4(),
    title: "-70 kg",
  ),
];

class ItemsController extends StateNotifier<List<Item>> {
  ItemsController() : super(items);

  void addItem(String title, Color? color) {
    state = [
      ...state,
      Item(
        id: Uuid().v4(),
        title: title,
        color: color,
      ),
    ];
  }

  void editItem(Item editedItem) {
    state = state.map((item) {
      if (item.id == editedItem.id) {
        return editedItem;
      }
      return item;
    }).toList();
  }

  void removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void setText(String text) {
    final items =
        text.split("\n").where((element) => element.isNotEmpty).map((e) {
      return Item(
        id: Uuid().v4(),
        title: e,
      );
    }).toList();
    state = items;
  }
}
