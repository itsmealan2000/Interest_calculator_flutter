import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'simple_interest_model.g.dart'; // This part file will be generated

@HiveType(typeId: 0)
class SimpleInterestModel extends HiveObject {
  @HiveField(0)
  final double interest;

  @HiveField(1)
  final double totalAmount;

  @HiveField(2)
  final String selectedUnit;

  @HiveField(3)
  final String timePeriod;

  @HiveField(4)
  final String? titlename;

  @HiveField(5)
  final String? timestamp;

  SimpleInterestModel({
    required this.interest,
    required this.totalAmount,
    required this.selectedUnit,
    required this.timePeriod,
    this.titlename,
    this.timestamp,
  });
}
