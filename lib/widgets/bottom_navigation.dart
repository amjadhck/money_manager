import 'package:flutter/material.dart';
import 'package:money_manager/screens/home_screen.dart';
import 'package:money_manager/widgets/custom_painter.dart';

class MoneyManagerBottomNavigation extends StatelessWidget {
  const MoneyManagerBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
        valueListenable: HomeScreen.selectedIndex,
        builder: (context, int upadatedIndex, _) {
          return Stack(
            children: [
              Positioned(
                bottom: 10,
                left: 0,
                child: CustomPaint(
                  size: Size(size.width, 80),
                  painter: RPSCustomPainter(),
                ),
              ),
              BottomNavigationBar(
                backgroundColor: Colors.white,
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
              ),
            ],
          );
        });
  }
}
