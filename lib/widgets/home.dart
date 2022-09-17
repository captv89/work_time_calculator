import 'package:flutter/material.dart';
import 'package:work_time/widgets/break_time.dart';
import 'package:work_time/widgets/change_theme_button.dart';
import 'package:work_time/widgets/title.dart';
import 'day_card_scroll.dart';

// Create a statefulWidget
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

// Create a state class
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Get the current theme
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: const TitleText(title: 'Work Time Calculator'),
        actions: const [
          //  Change Theme Switch
          ChangeThemeButton(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const BreakTime(),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 2,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: const [
                  SizedBox(height: 20),
                  DayCardScroll(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
