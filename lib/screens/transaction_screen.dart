import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return const Card(
            elevation: 10,
            child: ListTile(
              leading: CircleAvatar(
                  radius: 50,
                  child: Text("12\nDec", textAlign: TextAlign.center)),
              title: Text("1000"),
              subtitle: Text("Travel"),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}
