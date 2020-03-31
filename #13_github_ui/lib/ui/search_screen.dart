import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen"),
      ),
      body: Center(
        child: Text("Not constructed for brevity \n (You could go ahead and do it as an excercise)",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
