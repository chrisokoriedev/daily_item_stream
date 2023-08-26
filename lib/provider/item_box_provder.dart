import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/item.dart';

final itemBoxProvider = FutureProvider<Box<Item>>(
  (ref) => Hive.openBox<Item>("items"),
);
