import '../../core/app_import.dart';

final writerItemViewProvider =
    ChangeNotifierProvider((ref) => WriteItemViewModel());

class WriteItemViewModel extends ChangeNotifier {
  Item item = Item();
}
