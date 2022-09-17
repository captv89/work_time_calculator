import 'package:flutter/material.dart';
import 'package:work_time/themes/theme_provider.dart';
import 'package:work_time/widgets/card_form.dart';
import 'package:work_time/widgets/title.dart';

import 'day_card_template.dart';
import 'label_text.dart';

class DayCardScroll extends StatelessWidget {
  const DayCardScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const [
          DayCardTemplate(
            day: 'Monday',
            child: CardForm(),
          ),
          SizedBox(height: 20),
          DayCardTemplate(
            day: 'Tuesday',
            child: CardForm(),
          ),
          SizedBox(height: 20),
          DayCardTemplate(
            day: 'Wednesday',
            child: CardForm(),
          ),
          SizedBox(height: 20),
          DayCardTemplate(
            day: 'Thursday',
            child: CardForm(),
          ),
          SizedBox(height: 20),
          DayCardTemplate(
            day: 'Friday',
            child: CardForm(),
          ),
        ],
      ),
    );
  }
}
