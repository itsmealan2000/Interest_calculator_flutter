import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interestcalculator/pages/homepage.dart';
import 'package:interestcalculator/themes/theme_provider.dart';
import 'package:interestcalculator/database/model/simple_interest_model.dart';
import 'package:interestcalculator/database/model/compount_interest_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(SimpleInterestModelAdapter());
  Hive.registerAdapter(CompountInterestModelAdapter());

  await Hive.openBox<SimpleInterestModel>('simpleInterestBox');
  await Hive.openBox<CompountInterestModel>('compoundInterestBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      themeMode: themeProvider.currentThemeMode,
      theme: themeProvider.currentTheme,
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
