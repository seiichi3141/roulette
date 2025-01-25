import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roulette/items_controller.dart';
import 'package:roulette/models.dart';
import 'package:roulette/roulette_controller.dart';

final itemsProvider = Provider<List<Item>>((ref) {
  return ref.watch(itemsControllerProvider);
});

final itemLengthProvider = Provider<int>((ref) {
  return ref.watch(itemsProvider.select((value) => value.length));
});

final itemProvider = Provider.family<Item, String>((ref, id) {
  final items = ref.watch(itemsProvider);
  return items.firstWhere((item) => item.id == id);
});

final itemIndexProvider = Provider.family<int, String>((ref, id) {
  final items = ref.watch(itemsProvider);
  return items.indexWhere((item) => item.id == id);
});

final itemColorProvider = Provider.family<Color, String>((ref, id) {
  final item = ref.watch(itemProvider(id));
  final itemIndex = ref.watch(itemIndexProvider(id));
  return item.color ??
      (itemIndex % 2 == 0 ? Colors.blue : Colors.purple.shade100);
});

final itemOffsetsProvider = Provider.family<List<double>, String>((ref, id) {
  final index = ref.watch(itemIndexProvider(id));
  final itemLength = ref.watch(itemLengthProvider);
  final currentPosition =
      ref.watch(rouletteControllerProvider.select((value) => value.value));
  return [
    (currentPosition * itemLength) + index - 0.5 - itemLength * 2,
    (currentPosition * itemLength) + index - 0.5 - itemLength,
    (currentPosition * itemLength) + index - 0.5
  ];
});

final isHitItemProvider = Provider.family<bool, String>((ref, id) {
  final hitIndex = ref.watch(rouletteControllerProvider.select((value) {
    if (value is RouletteStateHit) {
      return value.hitIndex;
    }
    return -1;
  }));
  final itemIndex = ref.watch(itemIndexProvider(id));
  return hitIndex == itemIndex;
});

final isResultProvider = Provider<bool>((ref) {
  final rouletteState = ref.watch(rouletteControllerProvider);
  return rouletteState is RouletteStateHit;
});
