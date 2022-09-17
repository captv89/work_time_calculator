import 'package:flutter/material.dart';
import 'package:work_time/themes/theme_provider.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge?.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
