import 'package:flutter/material.dart';
import 'package:testmephysics/screens/policy_dialog.dart';
import 'package:testmephysics/utilities/constants.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Info Screen',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kYellow,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pacifico',
                )),
          ],
        ),
      ),
      body: Container(
        color: kRedDark,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
              // color: kTextFieldColour,
              decoration: BoxDecoration(
                color: kTextWht,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 5.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          'Thanks For Trying our App',
                          textScaleFactor: 2,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'This App tests you on the english GCSE keyStage 4 - Physics syllabus by asking a series of questions in a true/false format.  There is a sample set of 90 questions in this free version.',
                        textScaleFactor: 1.3,
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        '1.  Select Categories',
                        textScaleFactor: 1.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Text(
                          'By default the test will run with 45 questions spread across all categories.  However, you may select just the categories you are interested in.',
                          textScaleFactor: 1.3),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        '2.  Change Test Length',
                        textScaleFactor: 1.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Text(
                        'Use the plus and minus buttons on the selection page to change how may questions per category you wish the test to contain',
                        textScaleFactor: 1.3,
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            'Privacy Policy',
                            textScaleFactor: 1.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: kRedDark,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: FlatButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PolicyDialog(
                                            mdFileName: 'privacy.md',
                                          ))),
                              child: Text('Tap to Read',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: kTextWht,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            'Terms Of Use',
                            textScaleFactor: 1.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: kRedDark,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: FlatButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PolicyDialog(
                                            mdFileName: 'terms.md',
                                          ))),
                              child: Text('Tap to Read',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: kTextWht,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        'Contact Support',
                        textScaleFactor: 1.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Text(
                        'Admin@tally-ho-tech.uk',
                        textScaleFactor: 1.2,
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        'Thanks',
                        textScaleFactor: 1.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: Text(
                        'Many thanks to Lynn, Matt and Lewis for their contributions to testing and validating this app.',
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
