import '../core/app_import.dart';

final itemBoxProvider = FutureProvider<Box<Item>>(
  (ref) => Hive.openBox<Item>("items"),
);
