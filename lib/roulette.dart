import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roulette/providers.dart';
import 'package:roulette/roulette_controller.dart';

class Roulette extends ConsumerStatefulWidget {
  const Roulette({super.key});

  @override
  RouletteState createState() => RouletteState();
}

class RouletteState extends ConsumerState<Roulette> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(itemsProvider);

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                color: Color(0xFF234D85),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Stack(
                    children: items.map((item) {
                      return RouletteItem(
                          id: item.id, height: constraints.maxHeight);
                    }).toList(),
                  );
                }),
              ),
            ),
            // RouletteSlider(),
          ],
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.2),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.2),
                  ],
                  stops: [0.0, 0.3, 0.5, 0.7, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
      ],
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
    final isResult = ref.watch(isResultProvider);
    final isHit = ref.watch(isHitItemProvider(id));

    // log('title: ${item.title}, offsets: $offsets');
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: offsets.map((offset) {
            return Positioned.fromRect(
              rect: Rect.fromLTWH(
                0,
                offset * itemHeight + height * 0.5,
                constraints.maxWidth,
                itemHeight,
              ),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 600),
                scale: isResult && isHit ? 1.8 : 1.0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: !isResult || isHit ? 1.0 : 0.0,
                  child: Transform(
                    transform: Matrix4.rotationX((offset + 0.5) * 0.1),
                    alignment: (offset + 0.5) < 0
                        ? FractionalOffset.bottomCenter
                        : FractionalOffset.topCenter,
                    child: Container(
                      // color: Colors.grey,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: AutoSizeText(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ref.watch(itemColorProvider(id)),
                              fontSize: itemHeight * 0.85,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class RouletteSlider extends ConsumerWidget {
  const RouletteSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value =
        ref.watch(rouletteControllerProvider.select((value) => value.value));
    return Slider(
      value: value,
      onChanged: (value) {
        ref.read(rouletteControllerProvider.notifier).setValue(value);
      },
    );
  }
}
