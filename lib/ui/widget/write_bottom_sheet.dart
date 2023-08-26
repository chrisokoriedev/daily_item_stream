import 'package:flutter/material.dart';

class WriteBottomSheet extends StatelessWidget {
  const WriteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    final textStyle = style.textTheme;
    return Padding(
      padding: const EdgeInsets.all(15).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
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
            decoration: input(),
          ),
          const SizedBox(height: 20),
          Text(
            'description',
            style: textStyle.titleSmall,
          ),
          TextFormField(
            decoration: input(),
          ),
        ],
      ),
    );
  }

  InputDecoration input() => const InputDecoration(
      isCollapsed: true, contentPadding: EdgeInsets.all(5));
}
