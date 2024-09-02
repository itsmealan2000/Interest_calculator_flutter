import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interestcalculator/database/model/simple_interest_model.dart';
import 'package:interestcalculator/database/model/compount_interest_model.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  HistoryState createState() => HistoryState();
}

class HistoryState extends State<History> {
  String _selectedType = 'simple';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var simpleInterestBox = Hive.box<SimpleInterestModel>('simpleInterestBox');
    var compoundInterestBox =
        Hive.box<CompountInterestModel>('compoundInterestBox');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.01, vertical: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 2.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: DropdownButton<String>(
                  dropdownColor: Theme.of(context).colorScheme.inversePrimary,
                  value: _selectedType,
                  icon: Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).primaryIconTheme.color,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },
                  items: <String>['simple', 'compound']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.025, vertical: 5.0),
                        child: Text(
                          value == 'simple'
                              ? 'Simple Interest History'
                              : 'Compound Interest History',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    );
                  }).toList(),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  elevation: 8,
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: _selectedType == 'simple'
                  ? ValueListenableBuilder(
                      valueListenable: simpleInterestBox.listenable(),
                      builder: (context, Box<SimpleInterestModel> box, _) {
                        if (box.isEmpty) {
                          return const Center(
                            child: Text('No simple interest history'),
                          );
                        }
                        return ListView.builder(
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            var item = box.getAt(index) as SimpleInterestModel;
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              elevation: 8.0,
                              surfaceTintColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                              shadowColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  width: 1.5,
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(16.0),
                                title: Text(
                                  '${item.titlename}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Amount: ${item.totalAmount.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'Interest: ${item.interest.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'Term: ${item.timePeriod} ${item.selectedUnit}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'Date: ${item.timestamp}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () async {
                                    await box.deleteAt(
                                        index); // Delete the item from Hive
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : ValueListenableBuilder(
                      valueListenable: compoundInterestBox.listenable(),
                      builder: (context, Box<CompountInterestModel> box, _) {
                        if (box.isEmpty) {
                          return const Center(
                            child: Text('No compound interest history'),
                          );
                        }
                        return ListView.builder(
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            var item =
                                box.getAt(index) as CompountInterestModel;
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              elevation: 8.0,
                              surfaceTintColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                              shadowColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  width: 1.5,
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(16.0),
                                title: Text(
                                  '${item.ctitlename}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Amount: ${item.ctotalAmount.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'Interest: ${item.cinterest.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'Term: ${item.ctermValue} ${item.ctermLength}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'Date: ${item.ctimestamp}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () async {
                                    await box.deleteAt(
                                        index); // Delete the item from Hive
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
