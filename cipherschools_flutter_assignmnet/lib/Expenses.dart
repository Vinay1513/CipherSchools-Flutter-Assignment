import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cipherschools_flutter_assignmnet/Expenseprovider.dart';
import 'Expensemodelclass.dart';
import 'ExpenseProvider.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  String dropdownCategoryValue = "Food";
  String dropdownWalletValue = "Phonepe";
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void _addExpense(ExpenseProvider expenseProvider) async {
    if (_amountController.text.isEmpty) {
      return;
    }

    double amount = double.parse(_amountController.text);

    ExpenseScreen newExpense = ExpenseScreen(
      category: dropdownCategoryValue,
      amount: amount,
      description: _descriptionController.text,
      wallet: dropdownWalletValue,
    );

    await expenseProvider.addExpense(newExpense);

    _amountController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    ExpenseProvider expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Color.fromRGBO(0, 119, 255, 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Expense',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 228.0),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        'How much?',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Text(
                        "₹",
                        style: GoogleFonts.inter(
                          fontSize: 64,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _amountController,
                          style: TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                              fontSize: 64,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  right: 15,
                  top: 27,
                  left: 20,
                ),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38),
                    topRight: Radius.circular(38),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),
                      Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 10),
                          child: DropdownButtonFormField<String>(
                            value: dropdownCategoryValue,
                            items: [
                              "Food",
                              "Travel",
                              "Subscription",
                              "Shopping"
                            ].map((String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(category),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownCategoryValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 10),
                          child: TextFormField(
                            controller: _descriptionController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Description',
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 10),
                          child: DropdownButtonFormField<String>(
                            value: dropdownWalletValue,
                            items: ["Phonepe", "Paytm", "Google Pay", "Cash"]
                                .map((String wallet) {
                              return DropdownMenuItem<String>(
                                value: wallet,
                                child: Text(wallet),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownWalletValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => _addExpense(expenseProvider),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(127, 61, 255, 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 56,
                          width: 343,
                          child: Center(
                            child: Text(
                              'Continue',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 110.0),
                        child: Container(
                          height: 5,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
