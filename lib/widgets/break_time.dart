import 'package:flutter/material.dart';
import 'package:work_time/themes/theme_provider.dart';

// Global variable to hold the break time
double breakTime = 0.0;

class BreakTime extends StatefulWidget {
  const BreakTime({Key? key}) : super(key: key);

  @override
  BreakTimeState createState() => BreakTimeState();
}

class BreakTimeState extends State<BreakTime> {
  final _formKey = GlobalKey<FormState>();
  final _breakTimeController = TextEditingController();

  // Form to capture break time as decimal input
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _breakTimeController,
          decoration: InputDecoration(
            labelText: 'Break Time',
            labelStyle: context.textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            prefixIcon: const Icon(Icons.timer),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          style: context.textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.isEmpty) {
              const SnackBar(content: Text('Please enter break time'));
              breakTime = 0.0;
            } else {
              setState(() {
                breakTime = double.parse(value);
                SnackBar(content: Text('Break time is $breakTime'));
                debugPrint('Break time is $breakTime');
              });
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter break time';
            }

            return null;
          },
        ),
      ),
    );
  }
}
