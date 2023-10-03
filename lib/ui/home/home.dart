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

    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.grid_3x3,
                      size: 30,
                      color: Colors.white54,
                    ),
                  ),
                  FlutterLogo(
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Hello, Chrisdev',
                style: textStyle.titleLarge,
              ),
              const SizedBox(height: 10),
              ref.watch(itemProvider).when(
                    data: (data) => Text(
                      'You Have, ${{data.length}} Tasks',
                      style: textStyle.titleLarge!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.6),
                    ),
                    error: (Object error, StackTrace stackTrace) =>
                        const Text('Invalid data'),
                    loading: () => const SizedBox(),
                  ),
              ref.watch(itemProvider).when(
                  data: (item) => ListView.builder(
                      itemCount: item.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = item[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(data.title,style: textStyle.titleLarge,),
                          subtitle: Text(data.des,style: textStyle.titleMedium,),
                        );
                      }),
                  error: (error, stacktrace) =>
                      Center(child: Text(error.toString())),
                  loading: () => const Center(
                        child: Text('Loading'),
                      )),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: openBottomsheet,
        child: const Icon(
          Icons.add,
          size: 15,
        ),
      ),
    );
  }
}
