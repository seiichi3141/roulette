import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roulette/item_list_tile.dart';
import 'package:roulette/items_controller.dart';
import 'package:roulette/models.dart';
import 'package:roulette/providers.dart';
import 'package:roulette/roulette_controller.dart';

class ItemList extends ConsumerStatefulWidget {
  const ItemList({super.key});

  @override
  ItemListState createState() => ItemListState();
}

class ItemListState extends ConsumerState<ItemList>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(itemsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          controller: _tabController,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          tabs: const [
            Tab(text: 'List'),
            Tab(text: 'Text'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Column(
                    children: [
                      ItemListTile(id: item.id),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: const Divider(
                          height: 0,
                        ),
                      ),
                    ],
                  );
                },
              ),
              ItemsTextView(
                text: items.map((item) => item.title).join('\n'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    final ret = await showDialog<Item>(
                      context: context,
                      builder: (context) {
                        return EditItem(
                          item: Item(
                            id: '',
                            title: '',
                            color: Colors.blue,
                          ),
                        );
                      },
                    );

                    if (ret != null) {
                      ref
                          .read(itemsControllerProvider.notifier)
                          .addItem(ret.title, ret.color);
                    }
                  },
                  icon: Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                RouletteButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EditItem extends StatefulWidget {
  const EditItem({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  EditItemState createState() => EditItemState();
}

class EditItemState extends State<EditItem> {
  late final TextEditingController controller;
  late Item _item;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.item.title);
    _item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Title'),
            onChanged: (value) => _item = _item.copyWith(title: value),
          ),
          const SizedBox(height: 16),
          MaterialPicker(
            pickerColor: _item.color ?? Colors.blue,
            onColorChanged: (color) {
              setState(() {
                _item = _item.copyWith(color: color);
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_item);
          },
          child: const Text('OK'),
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

class ItemsTextView extends ConsumerStatefulWidget {
  const ItemsTextView({
    super.key,
    required this.text,
  });

  final String text;

  @override
  ItemsTextViewState createState() => ItemsTextViewState();
}

class ItemsTextViewState extends ConsumerState<ItemsTextView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: _controller,
        expands: true,
        minLines: null,
        maxLines: null,
        onChanged: (text) {
          ref.read(itemsControllerProvider.notifier).setText(text);
        },
      ),
    );
  }
}
