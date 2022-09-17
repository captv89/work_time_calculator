import 'package:flutter/material.dart';
import 'package:work_time/themes/theme_provider.dart';

// A Widget for the time card form
class CardFormTime extends StatefulWidget {
  final TextEditingController timeInController;
  final TextEditingController timeOutController;
  const CardFormTime(
      {Key? key,
      required this.timeInController,
      required this.timeOutController})
      : super(key: key);

  @override
  CardFormTimeState createState() => CardFormTimeState();
}

class CardFormTimeState extends State<CardFormTime> {
  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Time in
        Expanded(
          child: TextFormField(
            controller: widget.timeInController,
            decoration: InputDecoration(
              labelText: 'Time In',
              labelStyle: context.textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            style: context.textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                widget.timeInController.text =
                    time.toString().substring(10, 15);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter time in';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 20),
        // Time out
        Expanded(
          child: TextFormField(
            controller: widget.timeOutController,
            decoration: InputDecoration(
              labelText: 'Time Out',
              labelStyle: context.textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            style: context.textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                //convert time to 24h format
                widget.timeOutController.text =
                    time.toString().substring(10, 15);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter time out';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
