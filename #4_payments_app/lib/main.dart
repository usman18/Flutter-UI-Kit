import 'package:flutter/material.dart';
import 'package:payments_app/provider/transactions_provider.dart';
import 'dart:math';

import 'model/transaction.dart';

void main() => runApp(PaymentsApp());

class PaymentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff3A3A3A),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 8,
            left: 8,
            right: 8,
          ),
          child: Text(
            "Payments App",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _buildCardSection(),
            _buildSendMoneySection(context),
            _buildTransactionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSection() {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Card(
        color: Colors.transparent,
        elevation: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Container(
          padding: EdgeInsets.all(
            24,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
              8,
            )),
            gradient: LinearGradient(
              colors: [
                Color(0xffBC63F3),
                Color(0xffC147EF),
                Color(0xffDB61E7),
                Color(0xffE863EC),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "BALANCE",
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      "\$",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "14,530",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "CARD NUMBER",
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "1234 1234 1234 1234",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.search,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget _buildTransactionsSection() {
    return Container(
      color: Color(0xff3A3A3A),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "LAST MOVEMENTS",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  "SEE MORE",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            itemBuilder: (_, position) {
              Transaction transaction = TransactionsProvider.transactions[position];
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Text(
                    transaction.name.substring(0, 2).toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: Color.fromARGB(
                    _random.nextInt(256),
                    _random.nextInt(256),
                    _random.nextInt(256),
                    _random.nextInt(256),
                  ),
                ),
                title: Text(transaction.name),
                subtitle: Text(transaction.timestamp),
                trailing: Text(
                  transaction.amount,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            },
            itemCount: TransactionsProvider.transactions.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
          ),
        ],
      ),
    );
  }

  Widget _buildSendMoneySection(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "SEND MONEY",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 2,
              ),
            ),
          ),
          Row(
            children: TransactionsProvider.transactions.map((transaction) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      child: Text(
                        transaction.name.substring(0, 2).toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      backgroundColor: Color.fromARGB(
                        _random.nextInt(256),
                        _random.nextInt(256),
                        _random.nextInt(256),
                        _random.nextInt(256),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      transaction.name,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
