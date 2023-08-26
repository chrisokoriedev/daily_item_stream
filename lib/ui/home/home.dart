import '../../core/app_import.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    openBottomsheet([Item? item]) async {
      await showModalBottomSheet(
          enableDrag: true,
          isDismissible: false,
          isScrollControlled: true,
          context: context,
          builder: (context) => WriteBottomSheet(item));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ref.watch(itemProvider).when(
            data: (item) => ListView.builder(
                itemCount: item.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = item[index];
                  return ListTile(
                    title: Text(data.title),
                    subtitle: Text(data.des),
                  );
                }),
            error: (error, stacktrace) => Center(child: Text(error.toString())),
            loading: () => const Center(
                  child: Text('Loading'),
                )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: openBottomsheet,
        child: const Icon(
          Icons.add,
          size: 15,
        ),
      ),
    );
  }
}
