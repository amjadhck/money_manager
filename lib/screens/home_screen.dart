import 'package:flutter/material.dart';
import 'package:money_manager/screens/category_screen.dart';
import 'package:money_manager/screens/add_transactions_screen.dart';
import 'package:money_manager/screens/transaction_screen.dart';
import 'package:money_manager/widgets/bottom_navigation.dart';
import 'package:money_manager/widgets/popup_add_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
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
            Navigator.of(context).pushNamed(AddTransactonScreen.routeName);
          } else {
            showCategoryAddPopUp(context);

            // final _sample = CategoryModel(
            //   id: DateTime.now().microsecondsSinceEpoch.toString(),
            //   name: "Travel",
            //   type: Categorytype.expense,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
