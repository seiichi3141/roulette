import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roulette/items_controller.dart';
import 'package:roulette/providers.dart';
import 'package:roulette/roulette_controller.dart';

class ItemList extends ConsumerWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(item.title),
                    trailing: IconButton(
                      onPressed: () async {
                        final ret = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Delete item?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                        if (ret == true) {
                          ref
                              .read(itemsControllerProvider.notifier)
                              .removeItem(item.id);
                        }
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Divider(),
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RouletteButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RouletteButton extends ConsumerWidget {
  const RouletteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning = ref.watch(rouletteControllerProvider
        .select((value) => value is RouletteStateRunning));
    return ElevatedButton(
      child: Text(isRunning ? 'Stop' : 'Start'),
      onPressed: () {
        if (isRunning) {
          ref.read(rouletteControllerProvider.notifier).stop();
        } else {
          ref.read(rouletteControllerProvider.notifier).start();
        }
      },
    );
  }
}
