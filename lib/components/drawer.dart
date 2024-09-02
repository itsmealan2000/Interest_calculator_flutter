import 'package:flutter/material.dart';
import 'package:interestcalculator/pages/simple_interest.dart';
import 'package:interestcalculator/pages/compount_intrest.dart';
import 'package:interestcalculator/pages/history.dart';
import 'package:interestcalculator/pages/settings.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';

class Widgetdrawer extends StatelessWidget {
  const Widgetdrawer({super.key});

  // Function to launch URLs
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {
      Fluttertoast.showToast(
          msg: 'Could not launch $url',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Text('Interest Calculator',
                style: Theme.of(context).textTheme.titleSmall),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListTile(
            title: Text(
              'Simple Interest',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleInterest(),
                ),
              );
            },
            tileColor: Theme.of(context).colorScheme.tertiary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListTile(
            title: Text(
              'Compound Interest',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Compoundinterest(),
                ),
              );
            },
            tileColor: Theme.of(context).colorScheme.tertiary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListTile(
            title: Text(
              'History',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const History(),
                ),
              );
            },
            tileColor: Theme.of(context).colorScheme.tertiary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListTile(
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
            tileColor: Theme.of(context).colorScheme.tertiary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Divider(), // Divider to separate bottom section
          SizedBox(
            height: screenHeight * .15,
          ),
          ListTile(
            leading: Icon(
              Icons.reviews,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            title: Text(
              'Rate on Play Store',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            onTap: () {
              _launchURL(
                  'https://play.google.com/store/apps/details?id=your_app_id'); // Replace with your app's Play Store URL
            },
          ),
          ListTile(
              leading: Icon(Icons.subscriptions,
                  color: Theme.of(context).iconTheme.color),
              title: Text(
                'Subscribe on YouTube',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              onTap: () async {
                await EasyLauncher.url(
                    url:
                        'https://www.youtube.com/channel/UCjXuHBXY9QtmlJPAXkBoBdQ',
                    mode: Mode.platformDefault);
              })
        ],
      ),
    );
  }
}
