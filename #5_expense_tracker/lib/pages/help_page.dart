import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: () => Navigator.pop(context)),
        title: Text("Request Help"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffFE9AAC), Color(0xffFE3ADA), Colors.pinkAccent],
                ),
              ),
              child: Icon(FontAwesomeIcons.handsHelping,
                  size: MediaQuery.of(context).size.width * 0.3,
                ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("How can we help you?",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600
              ),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text("It looks like you are experiencing problems with out sign up process. We are here to help so please get in touch with us",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      padding: EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Color(0xff2D294A),
                        borderRadius: BorderRadius.all(Radius.circular(20),),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.chat, color: Colors.indigo,
                            size: 50,
                          ),
                          SizedBox(height: 25,),
                          Text("Chat to us"),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      padding: EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Color(0xff2D294A),
                        borderRadius: BorderRadius.all(Radius.circular(20),),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.email, color: Colors.deepPurple,
                            size: 50,
                          ),
                          SizedBox(height: 25,),
                          Text("Email Us"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

