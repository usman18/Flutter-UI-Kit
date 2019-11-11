import 'package:flutter/material.dart';
import 'package:plants_shop_ui/components/feature_row.dart';

import 'components/label.dart';
import 'components/size_card.dart';

void main() => runApp(PlantsApp());

class PlantsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlantScreen(),
      theme: ThemeData(
        primaryColor: Color(0xff0A2129),
        primaryColorDark: Color(0xff0A2129),
      ),
    );
  }
}

class PlantScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(56), bottomRight: Radius.circular(56)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Rubber Tree", style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16,),
                              child: Text("Robust and dramatic, with glossy leaves",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 20,),
                                Expanded(child: Label(label : "Easy to grow", color: Colors.green,)),
                                Expanded(child: Label(label : "Air cleaner", color: Colors.blue,)),
                              ],
                            ),
                            SizedBox(height: 30,),
                            _buildFeaturesSection(),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12),),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fyucca-palm-tree-pot-young-plant-many-green-leaves-black-background-56128357.jpg&f=1&nofb=1"),
                        height: 300,
                        width: 120,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,),
                    child: Text("Sizes Available",
                      style: TextStyle(color: Colors.white,
                        fontSize: 20, fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      SizeCard(size: "10''",),
                      SizeCard(size: "15''",),
                      SizeCard(size: "20''",),
                    ],
                  )
                ],
              ),
            ),),
          Expanded(child: _buildBottomButton(),),
        ],
      )
    );
  }


  Widget _buildBottomButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Add to Cart - ", style: TextStyle(
            color: Color(0xff0A2129),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),),
          Text("\$55", style: TextStyle(
            color: Color(0xff799271),
            fontSize: 22,
          ),),
        ],
      )
    );
  }

  Widget _buildFeaturesSection() {

    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xff11323B),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(18), topRight: Radius.circular(18),),
      ),
      child: Column(
        children: <Widget>[
          FeatureRow(icon: Icons.pin_drop, feature: "Every 7 days",),
          FeatureRow(icon: Icons.wb_sunny, feature: "Needs sun",),
          FeatureRow(icon: Icons.toys, feature: "Minimum of 1C",),
        ],
      ),
    );

  }


}



