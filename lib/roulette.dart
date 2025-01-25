import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roulette/providers.dart';

class Roulette extends ConsumerStatefulWidget {
  const Roulette({super.key});

  @override
  RouletteState createState() => RouletteState();
}

class RouletteState extends ConsumerState<Roulette> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(itemsProvider);

    return Container(
      color: Color(0xFF234D85),
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              log('constraints: $constraints');
              return Stack(
                children: items.map((item) {
                  return RouletteItem(
                      id: item.id, height: constraints.maxHeight);
                }).toList(),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class RouletteItem extends ConsumerWidget {
  const RouletteItem({super.key, required this.id, required this.height});

  final String id;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemHeight = height * 0.3;
    final item = ref.watch(itemProvider(id));
    final offsets = ref.watch(itemOffsetsProvider(id));

    return Stack(
      children: offsets.map((offset) {
        return Positioned(
          top: offset * itemHeight + height * 0.5,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              item.title,
              style: TextStyle(
                color: item.color,
                fontSize: itemHeight * 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
