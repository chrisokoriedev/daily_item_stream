import '../../core/app_import.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  get data => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
    );
  }
}
