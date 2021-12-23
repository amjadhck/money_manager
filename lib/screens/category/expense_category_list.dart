// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/models/category/category_model.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB.instance.expenseCategoryList,
      builder: (BuildContext ctx, List<CategoryModel> newList, _) {
        return ListView.separated(
          itemBuilder: (contex, index) {
            return Card(
              child: ListTile(
                title: Text(newList[index].name),
                trailing: IconButton(
                  onPressed: () {
                    CategoryDB.instance.deleteCategory(newList[index].id);
                    //print("value.id at delete call ${newList[index].id}");
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: newList.length,
        );
      },
    );
  }
}
