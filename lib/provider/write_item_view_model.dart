import '../../core/app_import.dart';

final writerItemViewProvider =
    ChangeNotifierProvider.autoDispose((ref) => WriteItemViewModel(ref));

class WriteItemViewModel extends ChangeNotifier {
  final Ref _ref;
  WriteItemViewModel(this._ref);

  Item item = Item();

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> write() async {
    try {
      final boxItem = await _ref.read(itemBoxProvider.future);
      await boxItem.add(item);
      _ref.refresh(itemProvider);
    } catch (e) {
      loading = false;
      return Future.error(e);
    }
  }
}
