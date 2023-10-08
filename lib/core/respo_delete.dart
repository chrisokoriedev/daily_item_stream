import 'app_import.dart';

final repositoryProvider = Provider((ref) => Repository(ref));

class Repository {
  final Ref _ref;

  Repository(this._ref);

  Future<void> deleteItem(dynamic key) async {
    final box = await _ref.read(itemBoxProvider.future);
    await box.delete(key);
    return _ref.refresh(itemProvider);
  }
}
