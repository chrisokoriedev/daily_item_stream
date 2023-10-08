import '../../core/app_import.dart';

final writerItemViewProvider =
    ChangeNotifierProvider.autoDispose((ref) => WriteItemViewModel(ref));

class WriteItemViewModel extends ChangeNotifier {
  final Ref _ref;
  WriteItemViewModel(this._ref);

  Item item = Item();
  void init(Item item) {
    if (this.item.key == null) {
      this.item = item;
    }
  }

  bool get isEditing => item.key != null;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> write() async {
    _loading = true;
    try {
      final boxItem = await _ref.read(itemBoxProvider.future);
      if (isEditing) {
        await boxItem.put(item.key, item);
      } else {
        await boxItem.add(item);
      }
      return _ref.refresh(itemProvider);
    } catch (e) {
      loading = false;
      return Future.error(e);
    }
  }
}
