import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../core/app_import.dart';

class WriteBottomSheet extends HookConsumerWidget {
  const WriteBottomSheet(this.itemNew, {super.key});
  final Item? itemNew;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemModel = ref.watch(writerItemViewProvider);
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;
    final scheme = theme.colorScheme;
    final formKey = useRef(GlobalKey<FormState>());
    if (itemNew != null) {
      itemModel.init(itemNew!);
    }

    return Form(
      key: formKey.value,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20).copyWith(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
              itemNew != null ? 'Edit Task' : 'Add New One!',
              style: textStyle.titleLarge!
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              itemNew != null
                  ? 'Update your task info'
                  : 'Tell me about Your Task:)',
              style: textStyle.titleLarge,
            ),
            const SizedBox(height: 30),
            Text(
              'Title',
              style: textStyle.titleSmall,
            ),
            TextFormField(
              initialValue: itemModel.item.title,
              onSaved: (value) => itemModel.item.title = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Title cannot be empty";
                }
                return null;
              },
              decoration: input(),
            ),
            const SizedBox(height: 20),
            Text(
              'description',
              style: textStyle.titleSmall,
            ),
            TextFormField(
              initialValue: itemModel.item.des,
              onSaved: (value) => itemModel.item.des = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Title cannot be empty";
                }
                return null;
              },
              decoration: input(),
            ),
            const SizedBox(height: 30),
            itemModel.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MaterialButton(
                    minWidth: 200,
                    elevation: 3,
                    height: 50,
                    color: scheme.primaryContainer,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () async {
                      if (formKey.value.currentState!.validate()) {
                        formKey.value.currentState!.save();
                        FocusScope.of(context).unfocus();
                        try {
                          await itemModel.write();
                          Navigator.pop(context);
                        } catch (e) {
                          AwesomeSnackbarContent(
                            title: 'status',
                            message: e.toString(),
                            contentType: ContentType.failure,
                          );
                        }
                      }
                    },
                    child: Text(itemModel.isEditing ? 'update' : 'Create'),
                  ),
          ],
        ),
      ),
    );
  }

  InputDecoration input() => const InputDecoration(
      isCollapsed: true, contentPadding: EdgeInsets.all(5));
}
