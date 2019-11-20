import 'package:expense_tracker/pages/help_page.dart';
import 'package:expense_tracker/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/icon_button.dart';

void main() => runApp(ExpenseTrackerApp());

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff1C1934),
        accentColor: Colors.pink,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<IconData> bottomBarIcons = [Icons.calendar_today, Icons.insert_chart, Icons.person_outline];


  double amount = 10;
  int currentTabSelected = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          _buildBody(),
          Align(child: _buildBottomBar(),
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(66,)),
              gradient: LinearGradient(colors: [Color(0xff682CFC),
                Color(0xffB730F9),],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 42, left: 24,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text("This week", style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("\$4.12", style: TextStyle(
                              fontSize: 42, fontWeight: FontWeight.bold,
                            ),),

                            SizedBox(height: 8,),

                            Text("Total Contributions", style: TextStyle(
                              fontSize: 15,
                            ),),
                          ],
                        ),

                        Text("Will be collected on Monday",
                          style: TextStyle(
                          fontSize: 15,
                        ),),
                        
                      ],
                    ),
                  ),
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 12),
                  child: Icon(FontAwesomeIcons.piggyBank,
                    color: Color(0xffFB71BC),
                    size: 100,
                  ),
                ),),
              ],
            ),
          ),
        ),
        Expanded(child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20,),
                child: Text("Recurring contribution",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ActionButton(icon: FontAwesomeIcons.minus, onTap: () {
                      if (amount == 1) {
                        return;
                      }
                      setState(() {
                        amount--;
                      });
                    }),
                    Text("\$$amount", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                    ActionButton(icon: FontAwesomeIcons.plus, onTap: () {
                      setState(() {
                        amount++;
                      });
                    }),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Next contribution date:",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff716E8A),
                      ),
                    ),

                    Text("15 Oct 2017",
                      style: TextStyle(
                        color: Color(0xff6D5ADB),
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
              )

            ],
          ),
        )),
      ],
    );
  }

  Widget _buildBottomBar() {

    return Card(
      color: Color(0xff2D294A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36), bottomRight: Radius.circular(36),)),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: IconButton(icon: Icon(bottomBarIcons[0],
                color: currentTabSelected == 0 ? Colors.pink : Color(0xff757495),
              ), onPressed: () {
                setState(() {
                  currentTabSelected = 0;
                });
              }),
            ),
            Expanded(
              child: IconButton(icon: Icon(bottomBarIcons[1],
                color: currentTabSelected == 1 ? Colors.pink : Color(0xff757495),
              ), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => StatisticsPage()));
              }),
            ),
            Expanded(
              child: IconButton(icon: Icon(bottomBarIcons[2],
                color: currentTabSelected == 2 ? Colors.pink : Color(0xff757495),
              ), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => HelpPage(),));
              }),
            ),
          ]
        ),
      ),
    );
  }

}



