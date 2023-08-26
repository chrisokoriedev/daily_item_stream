import '../../core/app_import.dart';

class WriteBottomSheet extends HookConsumerWidget {
  const WriteBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemModel = ref.read(writerItemViewProvider);
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;
    final scheme = theme.colorScheme;
    final formKey = useRef(GlobalKey<FormState>());

    return Form(
      key: formKey.value,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20).copyWith(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Create Item',
                style: textStyle.titleMedium,
              ),
            ),
            const SizedBox(height: 5),
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
            MaterialButton(
              minWidth: double.infinity,
              elevation: 3,
              color: scheme.primaryContainer,
              onPressed: () {},
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration input() => const InputDecoration(
      isCollapsed: true, contentPadding: EdgeInsets.all(5));
}
