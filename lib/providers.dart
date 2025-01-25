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
