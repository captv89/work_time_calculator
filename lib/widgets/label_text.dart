import 'package:flutter/material.dart';
import 'package:work_time/themes/theme_provider.dart';

class LabelText extends StatelessWidget {
  final String label;
  const LabelText({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.textTheme.titleMedium?.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
