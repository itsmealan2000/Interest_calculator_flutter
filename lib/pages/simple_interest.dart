import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:interestcalculator/database/model/simple_interest_model.dart';
import 'package:intl/intl.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  double interest = 0.0;
  double principal = 0.0;
  double rate = 0.0;
  double term = 0.0;
  String selectedUnit = 'Years';

  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController termController = TextEditingController();

  final List<String> units = ['Years', 'Months', 'Days'];
  List<Map<String, String>> termUnit = [];
  List<Map<String, double>> savedCards = [];

  @override
  void initState() {
    super.initState();
    principalController.addListener(_calculateInterest);
    rateController.addListener(_calculateInterest);
    termController.addListener(_calculateInterest);
  }

  @override
  void dispose() {
    principalController.dispose();
    rateController.dispose();
    termController.dispose();
    super.dispose();
  }

  void _calculateInterest() {
    setState(() {
      principal = double.tryParse(principalController.text) ?? 0.0;
      rate = double.tryParse(rateController.text) ?? 0.0;
      term = double.tryParse(termController.text) ?? 0.0;

      // Convert term to years if necessary
      if (selectedUnit == 'Months') {
        term /= 12;
      } else if (selectedUnit == 'Days') {
        term /= 365;
      }
      interest = (principal * rate * term) / 100;
    });
  }

  void _saveCurrentValues() {
    if (principal == 0.0 || rate == 0.0 || term == 0.0) {
      Fluttertoast.showToast(
        msg: "Please enter valid values",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        textColor: Theme.of(context).colorScheme.primary,
      );
      return;
    }

    setState(() {
      savedCards.add({
        'interest': interest,
        'totalAmount': principal + interest,
      });
      termUnit.add({
        'termlength': selectedUnit,
        'timePeriod': termController.text,
      });
      // Define your date format
      final DateFormat dateFormat = DateFormat('hh:mm a dd-MM-yyyy');
      // Get the current DateTime
      DateTime now = DateTime.now();
      // Convert DateTime to String
      String timestampStr = dateFormat.format(now);

      final simpleInterestBox =
          Hive.box<SimpleInterestModel>('simpleInterestBox');
      final newRecord = SimpleInterestModel(
        interest: interest,
        totalAmount: principal + interest,
        selectedUnit: selectedUnit,
        timePeriod: termController.text,
        titlename: "Simple Interest",
        timestamp: timestampStr,
      );

      simpleInterestBox.add(newRecord);

      Fluttertoast.showToast(
        msg: "Saved !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        textColor: Theme.of(context).colorScheme.primary,
      );
    });
  }

  void _resetValues() {
    setState(() {
      principal = 0.0;
      rate = 0.0;
      term = 0.0;
      interest = 0.0;
      selectedUnit = 'Years';
      principalController.clear();
      rateController.clear();
      termController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? 'assets/logo/X_light.png'
              : 'assets/logo/X.png',
          height: 120.0,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 5.0),
              Text(
                'Simple Interest',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Principal',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintText: 'Enter Principal e.g. 12000',
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: principalController,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintText: 'In percent %',
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: rateController,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Term',
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintText: 'Specify the term period',
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: termController,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10.0),
              PopupMenuButton<String>(
                shadowColor: Theme.of(context).colorScheme.outlineVariant,
                onSelected: (String newUnit) {
                  setState(() {
                    selectedUnit = newUnit;
                    _calculateInterest();
                  });
                },
                itemBuilder: (BuildContext context) {
                  return units.map((String unit) {
                    return PopupMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList();
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          border: Border.all(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              selectedUnit,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15.0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _saveCurrentValues,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Text(
                          'Save',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _resetValues,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: Text(
                          'Reset',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 2.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: ListTile(
                  title: Text(
                    'Interest Amount : ${interest.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                      'Total Amount : ${(principal + interest).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      savedCards.clear();
                      termUnit.clear(); // Clear termUnit list as well
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    elevation: 0,
                  ),
                  child: Icon(
                    Icons.clear_all,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: savedCards.length,
                  itemBuilder: (context, index) {
                    final reversedIndex = savedCards.length - 1 - index;
                    final savedCard = savedCards[reversedIndex];
                    final unit = termUnit.isNotEmpty
                        ? termUnit[reversedIndex]['termlength'] ?? ''
                        : '';
                    final termValue = termUnit.isNotEmpty
                        ? termUnit[reversedIndex]['timePeriod'] ?? ''
                        : '';
                    return SafeArea(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainer,
                              width: 2.0,
                            )),
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Interest : ${savedCard['interest']!.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: Text(
                                '$termValue $unit',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  'Total Amount : ${savedCard['totalAmount']!.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )),
                            OverflowBar(
                              alignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                    elevation: 0,
                                  ),
                                  child: Icon(
                                    Icons.share,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 30,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                    elevation: 0,
                                  ),
                                  child: Icon(
                                    Icons.save_alt_rounded,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
