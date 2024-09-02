import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'compount_interest_model.g.dart'; // This part file will be generated

@HiveType(typeId: 1)
class CompountInterestModel extends HiveObject {
  @HiveField(0)
  final double cinterest;

  @HiveField(1)
  final double ctotalAmount;

  @HiveField(2)
  final String ctermLength;

  @HiveField(3)
  final String ctermValue;

  @HiveField(7)
  final String? ctitlename;

  @HiveField(8)
  final String? ctimestamp;

  CompountInterestModel({
    required this.cinterest,
    required this.ctotalAmount,
    required this.ctermLength,
    required this.ctermValue,
    this.ctitlename,
    this.ctimestamp,
  });
  
}