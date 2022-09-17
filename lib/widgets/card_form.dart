import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_time/themes/theme_provider.dart';
import 'package:work_time/widgets/break_time.dart';
import 'package:work_time/widgets/card_form_time.dart';

class CardForm extends StatefulWidget {
  const CardForm({Key? key}) : super(key: key);

  @override
  CardFormState createState() => CardFormState();
}

class CardFormState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();
  final _timeIn = TextEditingController();
  final _timeOut = TextEditingController();
  String _timeDifference = '0.0';

  @override
  Widget build(BuildContext context) {
    // return a container with time in, time out, break time and calculate button with result text
    //use the material time picker to pick time
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CardFormTime(
            timeInController: _timeIn,
            timeOutController: _timeOut,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    final difference = await calculateTimeDifference();
                    setState(() {
                      _timeDifference = difference;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter time in and time out')),
                    );
                  }
                },
                child: const Text('Calculate'),
              ),
              //  Show the result in a box
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _timeDifference,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//  Calculate the time difference between time in and time out
  Future calculateTimeDifference() async {
    //  Get the time in and time out
    final timeIn = _timeIn.text;
    final timeOut = _timeOut.text;

    // Add date to time in and time out
    final timeInDateTime = DateTime.parse('2021-01-01 $timeIn');
    final timeOutDateTime = DateTime.parse('2021-01-01 $timeOut');

    debugPrint('Time in: $timeIn');
    debugPrint('Time out: $timeOut');

    //  Convert the time in and time out to DateTime
    // final timeInDateTime = DateTime.parse(timeIn);
    // final timeOutDateTime = DateTime.parse(timeOut);

    //  Calculate the difference between time in and time out
    final difference = timeOutDateTime.difference(timeInDateTime);

    //  Format the difference to decimal
    final formattedDifference =
        NumberFormat('00.00').format(difference.inMinutes / 60);

    // formattedDifference to double
    final formattedDifferenceDouble = double.parse(formattedDifference);

    final workingTime = formattedDifferenceDouble - breakTime;
    debugPrint('Working time: $workingTime');
    //  Return the difference as a string
    return workingTime.toString();
  }
}
