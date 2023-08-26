import 'package:daily_item_stream/provider/item_proiver.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  get data => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(itemProvider).when(
          data: (item) => ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final data = item[index];
                return Column(
                  children: [
                    Text(data.title),
                    Text(data.des),
                  ],
                );
              }),
          error: (error, stacktrace) => Text(error.toString()),
          loading: () => const Center(
                child: Text('Loading'),
              )),
    );
  }
}
