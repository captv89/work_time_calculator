import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time/themes/theme_provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(
      value: themeProvider.isDark,
      activeThumbImage: const AssetImage('assets/images/moon.png'),
      inactiveThumbImage: const AssetImage('assets/images/sun.png'),
      activeTrackColor: Theme.of(context).colorScheme.surface.withOpacity(0.5),
      inactiveTrackColor:
          Theme.of(context).colorScheme.surface.withOpacity(0.5),
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
