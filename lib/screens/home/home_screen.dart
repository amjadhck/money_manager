// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:money_manager/screens/category/category_screen.dart';
import 'package:money_manager/screens/home/widgets/bottom_navigation.dart';
import 'package:money_manager/screens/transaction/transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
  final _pages = const [
    TransactionScreen(),
    CategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Manager"),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext context, int updateIndex, Widget? _) {
          return _pages[updateIndex];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndex.value == 0) {
            print("Add Transaction");
            print("0");
          } else {
            print("Add cateegory");
            print("1");
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
