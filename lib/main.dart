import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PE",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Color themeColor = Colors.pink[200];
  final List<Transaction> transactions = [
    Transaction(
      id: 1,
      itemName: "Shirt",
      price: 100.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      itemName: "Shoes",
      price: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 3,
      itemName: "Watch",
      price: 120.00,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        backgroundColor: themeColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "CHART",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tran) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: themeColor),
                      ),
                      child: Text(
                        "₹" + tran.price.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tran.itemName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.black87),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tran.date),
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
