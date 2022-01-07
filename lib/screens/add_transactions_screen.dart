import 'package:flutter/material.dart';
import 'package:money_manager/db/category_db.dart';
import 'package:money_manager/db/transaction_db.dart';
import 'package:money_manager/models/category_model.dart';
import 'package:money_manager/models/transaction_model.dart';

class AddTransactonScreen extends StatefulWidget {
  static const routeName = "add-transaction";
  const AddTransactonScreen({Key? key}) : super(key: key);

  @override
  State<AddTransactonScreen> createState() => _AddTransactonScreenState();
}

class _AddTransactonScreenState extends State<AddTransactonScreen> {
  DateTime? _selecteDate;
  Categorytype? _selectedCategoryType;
  CategoryModel? _selectedCategoryModal;
  String? _categoryID;

  final _purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();

  @override
  void initState() {
    _selectedCategoryType = Categorytype.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transacton"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _purposeTextEditingController,
                decoration: const InputDecoration(hintText: 'Purpose'),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: _amountTextEditingController,
                decoration: const InputDecoration(hintText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              TextButton.icon(
                onPressed: () async {
                  final _selectedDateTemp = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 30)),
                    lastDate: DateTime.now(),
                  );
                  if (_selectedDateTemp == null) {
                    return;
                  } else {
                    setState(() {
                      _selecteDate = _selectedDateTemp;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: Text(_selecteDate == null
                    ? "Select Date"
                    : _selecteDate.toString()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<Categorytype>(
                        value: Categorytype.income,
                        groupValue: _selectedCategoryType,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCategoryType = newValue!;
                            _categoryID = null;
                          });
                        },
                      ),
                      const Text("Income"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<Categorytype>(
                        value: Categorytype.expense,
                        groupValue: _selectedCategoryType,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCategoryType = newValue!;
                            _categoryID = null;
                          });
                        },
                      ),
                      const Text("Expense"),
                    ],
                  ),
                ],
              ),
              DropdownButton(
                value: _categoryID,
                hint: const Text("Select Category"),
                items: (_selectedCategoryType == Categorytype.income
                        ? CategoryDB().incomeCategoryList
                        : CategoryDB().expenseCategoryList)
                    .value
                    .map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                    onTap: () {
                      _selectedCategoryModal = e;
                    },
                  );
                }).toList(),
                onChanged: (String? selectedValue) {
                  setState(() {
                    _categoryID = selectedValue!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  addTransaction();
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addTransaction() async {
    final _purposeText = _purposeTextEditingController.text;
    final _amountText = _amountTextEditingController.text;
    if (_purposeText.isEmpty) {
      return;
    }
    if (_amountText.isEmpty) {
      return;
    }
    if (_categoryID == null) {
      return;
    }
    if (_selecteDate == null) {
      return;
    }
    final _parsedAmount = double.tryParse(_amountText);
    if (_parsedAmount == null) {
      return;
    }
    if (_selectedCategoryModal == null) {
      return;
    }

    final _model = TransactionModel(
      puropse: _purposeText,
      amount: _parsedAmount,
      date: _selecteDate!,
      type: _selectedCategoryType!,
      cetegory: _selectedCategoryModal!,
    );
    TransactionDB.instance.addTransaction(_model);
    Navigator.of(context).pop();
    TransactionDB.instance.refresh();
  }
}
