import 'package:flutter/cupertino.dart';

import '../../core/app_import.dart';
import '../../core/respo_delete.dart';

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
              IntrinsicWidth(
                stepWidth: double.infinity,
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
                          data: (data) => Row(
                            children: [
                              Text(
                                'You Have,',
                                style: textStyle.titleLarge!.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.6),
                              ),
                              Text(
                                '${{data.length}}',
                                style: textStyle.titleLarge!.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.6),
                              ),
                              Text(
                                data.length <= 1 ? '\t😵' : '\t😎',
                                style: textStyle.titleLarge!.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.6),
                              ),
                              Text(
                                ' Tasks',
                                style: textStyle.titleLarge!.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.6),
                              ),
                            ],
                          ),
                          error: (Object error, StackTrace stackTrace) =>
                              const Text('Invalid data'),
                          loading: () => const SizedBox(),
                        ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: ref.watch(itemProvider).when(
                    data: (item) => ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          final data = item[index];
                          return Row(
                            children: [
                              Flexible(
                                flex: 10,
                                child: Card(
                                  color: Colors.deepPurple,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    onTap: () => openBottomsheet(data),
                                    title: Text(data.title,
                                        style: textStyle.titleLarge!
                                            .copyWith(fontSize: 30)),
                                    subtitle: Text(
                                      data.des,
                                      maxLines: 3,
                                      style: textStyle.titleMedium!
                                          .copyWith(color: Colors.white54),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                      child: GestureDetector(
                                          onTap: () {
                                            ref
                                                .read(repositoryProvider)
                                                .deleteItem(data.key);
                                          },
                                          child: const Icon(
                                            CupertinoIcons.delete,
                                            color: Color.fromARGB(255, 118, 53, 49),
                                          )))
                                ],
                              ))
                            ],
                          );
                        }),
                    error: (error, stacktrace) =>
                        Center(child: Text(error.toString())),
                    loading: () => const Center(
                          child: Text('Loading'),
                        )),
              ),
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
