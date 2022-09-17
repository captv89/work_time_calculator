import 'package:flutter/material.dart';
import 'package:work_time/themes/theme_provider.dart';

import 'label_text.dart';

// Wrap the card form widget
class DayCardTemplate extends StatelessWidget {
  final String day;
  final Widget child;
  const DayCardTemplate({Key? key, required this.child, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Add the day label
            LabelText(label: day),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}
