import 'package:flutter/material.dart';

class WriteBottomSheet extends StatelessWidget {
  const WriteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(15).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Create Item',
            style: style.bodyLarge,
          ),
          TextFormField(),
          TextFormField(),
        ],
      ),
    );
  }
}
