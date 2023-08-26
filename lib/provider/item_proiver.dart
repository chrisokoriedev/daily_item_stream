
import '../core/app_import.dart';

final itemProvider = FutureProvider<List<Item>>(
  (ref) async {
    final box = await ref.watch(itemBoxProvider.future);
    return box.values.toList();
  },
);
