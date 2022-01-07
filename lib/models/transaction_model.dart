import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/models/category_model.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final String puropse;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final Categorytype type;
  @HiveField(4)
  final CategoryModel cetegory;

  @HiveField(5)
  String? id;

  TransactionModel({
    required this.puropse,
    required this.amount,
    required this.date,
    required this.type,
    required this.cetegory,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
