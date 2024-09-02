import 'package:flutter/material.dart';
import 'package:interestcalculator/pages/simple_interest.dart';
import 'package:interestcalculator/pages/compount_intrest.dart';
import 'package:interestcalculator/components/drawer.dart';
import 'package:interestcalculator/pages/history.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Widgetdrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        title: Text(
          'Interest Calculator',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarHeight: 100,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.history,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const History()));
            },
          ),
          const SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SimpleInterest()));
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: const Size(double.infinity, 100.0),
                    minimumSize: const Size(double.infinity, 80.0),
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: Text(
                  'Simple Interest',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Compoundinterest()));
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: const Size(double.infinity, 100.0),
                    minimumSize: const Size(double.infinity, 80.0),
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: Text(
                  'Compound Interest',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Spacer(),
              Image.asset(
                Theme.of(context).brightness == Brightness.light
                    ? 'assets/logo/X_light.png'
                    : 'assets/logo/X.png',
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
