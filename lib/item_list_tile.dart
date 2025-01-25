import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roulette/item_list.dart';
import 'package:roulette/items_controller.dart';
import 'package:roulette/models.dart';
import 'package:roulette/providers.dart';

class ItemListTile extends ConsumerWidget {
  const ItemListTile({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(id));

    return ListTile(
      title: Text(item.title),
      onTap: () async {
        final ret = await showDialog<Item?>(
          context: context,
          builder: (context) {
            return EditItem(item: item);
          },
        );

        if (ret != null) {
          ref.read(itemsControllerProvider.notifier).editItem(ret);
        }
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            color: ref.watch(itemColorProvider(id)),
          ),
          IconButton(
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
                ref.read(itemsControllerProvider.notifier).removeItem(item.id);
              }
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
