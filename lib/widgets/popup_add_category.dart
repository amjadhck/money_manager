import 'package:flutter/material.dart';
import 'package:money_manager/db/category_db.dart';
import 'package:money_manager/models/category_model.dart';

ValueNotifier<Categorytype> selectedcategoryNotifier =
    ValueNotifier(Categorytype.income);

Future<void> showCategoryAddPopUp(BuildContext context) async {
  final _nameEditingController = TextEditingController();

  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        title: const Text("Add Category"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameEditingController,
              decoration: const InputDecoration(
                hintText: "Category Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                RadioButton(title: "Income", type: Categorytype.income),
                RadioButton(title: "Expense", type: Categorytype.expense),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final _name = _nameEditingController.text;
                if (_name.isEmpty) {
                  return;
                }
                final _type = selectedcategoryNotifier.value;
                final _category = CategoryModel(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  name: _name,
                  type: _type,
                );
                CategoryDB.instance.insertCategory(_category);
                Navigator.of(ctx).pop();
              },
              child: const Text("Add"),
            ),
          )
        ],
      );
    },
  );
}

class RadioButton extends StatelessWidget {
  final String title;
  final Categorytype type;

  const RadioButton({Key? key, required this.title, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedcategoryNotifier,
            builder: (BuildContext ctx, Categorytype newCategory, Widget? _) {
              return Radio<Categorytype>(
                  value: type,
                  groupValue: newCategory,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    selectedcategoryNotifier.value = value;
                    selectedcategoryNotifier.notifyListeners();
                  });
            }),
        Text(title),
      ],
    );
  }
}
