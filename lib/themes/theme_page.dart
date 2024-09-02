import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interestcalculator/themes/theme_provider.dart';
import 'package:interestcalculator/themes/theme_mode.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Theme',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Light'),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .updateThemeMode(AppThemeMode.light);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Dark'),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .updateThemeMode(AppThemeMode.dark);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('AMOLED'),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .updateThemeMode(AppThemeMode.amoled);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
