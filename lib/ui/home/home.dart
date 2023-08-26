import '../../core/app_import.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  get data => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          error: (error, stacktrace) => Center(child: Text(error.toString())),
          loading: () => const Center(
                child: Text('Loading'),
              )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => showModalBottomSheet(
            enableDrag: true,
            isDismissible: false,
            isScrollControlled: true,
            showDragHandle: true,
            context: context,
            builder: (context) => const WriteBottomSheet()),
        child: const Icon(
          Icons.add,
          size: 15,
        ),
      ),
    );
  }
}
