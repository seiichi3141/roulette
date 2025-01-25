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
    color: Color(0xFF299FE4),
  ),
  Item(
    id: Uuid().v4(),
    title: "-57 kg",
    color: Color(0xFFDDB6FF),
  ),
  Item(
    id: Uuid().v4(),
    title: "-90 kg",
    color: Color(0xFF299FE4),
  ),
  Item(
    id: Uuid().v4(),
    title: "+70 kg",
    color: Color(0xFFDDB6FF),
  ),
  Item(
    id: Uuid().v4(),
    title: "+90 kg",
    color: Color(0xFF299FE4),
  ),
  Item(
    id: Uuid().v4(),
    title: "-70 kg",
    color: Color(0xFFDDB6FF),
  ),
];

class ItemsController extends StateNotifier<List<Item>> {
  ItemsController() : super(items);

  void addItem(String title, Color color) {
    state = [
      ...state,
      Item(
        id: Uuid().v4(),
        title: title,
        color: color,
      ),
    ];
  }

  void removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}
