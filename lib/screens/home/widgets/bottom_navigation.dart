import 'package:flutter/material.dart';
import 'package:money_manager/screens/home/home_screen.dart';

class MoneyManagerBottomNavigation extends StatelessWidget {
  const MoneyManagerBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HomeScreen.selectedIndex,
        builder: (context, int upadatedIndex, _) {
          return BottomNavigationBar(
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            currentIndex: upadatedIndex,
            onTap: (newIndex) {
              HomeScreen.selectedIndex.value = newIndex;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Transactions",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Categories")
            ],
          );
        });
  }
}
