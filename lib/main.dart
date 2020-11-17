import 'package:flutter/material.dart';
import 'package:testmephysics/screens/test_page.dart';
import 'package:testmephysics/utilities/constants.dart';

void main() => runApp(TestMe());

class TestMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kRedDark, canvasColor: kRedMid, accentColor: kRedMid),
      home: Scaffold(
        backgroundColor: kRedDark,
        // drawer: SelectionScreen(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TestPage(),
          ),
        ),
      ),
    );
  }
}
