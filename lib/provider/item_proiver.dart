import 'package:daily_item_stream/model/item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item_box_provder.dart';

final itemProvider = FutureProvider<List<Item>>(
  (ref) async {
    final box = await ref.watch(itemBoxProvider.future);
    return box.values.toList();
  },
);
