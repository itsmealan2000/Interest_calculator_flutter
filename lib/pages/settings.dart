import 'package:flutter/material.dart';
import 'package:interestcalculator/themes/theme_page.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: ListTile(
        //theme
        title: const Text('Theme'),
        subtitle: const Text('Select a theme'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ThemePage(),
            ),
          );
        },
      ),
    );
  }
}
