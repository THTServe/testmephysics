import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:testmephysics/screens/selection.dart';
import 'package:testmephysics/utilities/constants.dart';
import 'package:testmephysics/utilities/physics_quiz_master.dart';

PhysicsQuizMaster physicsQM = PhysicsQuizMaster();

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // Create an empty list of Icons
  // List<Icon> scoreIndicator = [];
  String currentCategory;

  // int questionsPerCategory;

  //Scores for using in feedback report
  int engScore = 0;
  int forScore = 0;
  int fomScore = 0;
  int wavScore = 0;
  int elcScore = 0;
  int magScore = 0;
  int somScore = 0;
  int atmScore = 0;
  int spyScore = 0;
  bool correctAnswer;
  // Icon _correct = Icon(Icons.check, color: kYellow, size: 20.0);
  // Icon _incorrect = Icon(Icons.clear, color: kYellow, size: 20.0);

  // Used to know when to reset the screen on a restart
  bool testRestarted = false;

  //used to change text styling when the answer has been givem
  bool choiceMade = false;

  //used to set all the categories to true on the first run.
  bool firstRun = true;

  //length of each category chosen // may be replaced later when the user sets
  // test length
  // int catLen = 1;

  //String to hold feedback for when question is correctly guessed
  String feedbackTopText = '';

  //Used to change next button text on last question
  bool lastQuestion = false;

  //List to hold a view of chosen categories that gets passed to the choice
  // screen and reset on return based on choices
  Map<String, dynamic> masterCatMapList = {
    'eng': true,
    'for': true,
    'fom': true,
    'wav': true,
    'elc': true,
    'mag': true,
    'som': true,
    'atm': true,
    'spy': true,
    'qpc': 5
  };

  @override
  Widget build(BuildContext context) {
    /// Do some work to set things up if this is the first run
    if (firstRun) {
      physicsQM.start(masterCatMapList);
      firstRun = false;
      testRestarted = false;
      // questionsPerCategory = 5;
    } else {
      ///If not first run then restart with current choice of categories
      if (testRestarted) {
        physicsQM.restart(masterCatMapList);
        engScore = 0;
        forScore = 0;
        fomScore = 0;
        wavScore = 0;
        elcScore = 0;
        magScore = 0;
        somScore = 0;
        atmScore = 0;
        spyScore = 0;
        testRestarted = false;
      }
    }

    ///Main Build Work
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //---------------------------------------------------------------------- Icon
        Container(
            child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.dehaze),
              color: kTextWht,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  isScrollControlled: true,
                  builder: (context) => SelectionScreen(
                    catMapList: masterCatMapList,
                  ),
                ).then((value) {
                  //Check to make sure we dont send a null list to restart
                  value == null
                      ? masterCatMapList = masterCatMapList
                      : masterCatMapList = value;
                  setState(() {
                    // scoreIndicator = [];
                    physicsQM.restart(masterCatMapList);
                    testRestarted = true;
                    choiceMade = false;
                  });
                });
              },
            ),
            SizedBox(
              width: 5.0,
            ),
            Text("Test Me - ",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kYellow,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pacifico',
                )),
            Text('PHYSICS',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kTextWht,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Pacifico',
                )),
          ],
        )),
        //---------------------------------------------------------------------- Category Text
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: kTextWhtTrans, width: 3.0),
                  color: kRedMid,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    getCategory(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        //---------------------------------------------------------------------- Question Text
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: kTextWhtTrans, width: 3.0),
                  color: kRedMid,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    physicsQM.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: choiceMade
                        ? TextStyle(
                            fontSize: 21.0,
                            color: kTextWhtTrans,
                          )
                        : TextStyle(
                            fontSize: 21.0,
                            color: kTextWht,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            //------------------------------------------------------------------ True Button
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kYellow, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  textColor: Colors.white,
                  color: kRedDark,
                  child: Text('True',
                      style: choiceMade
                          ? TextStyle(
                              fontSize: 20.0,
                              color: kTextWhtTrans,
                            )
                          : TextStyle(
                              fontSize: 20.0,
                              color: kTextWht,
                            )),
                  onPressed: () {
                    if (choiceMade == false) {
                      checkAnswer(true);
                      choiceMade = true;
                    }
                    // feedbackAlert();
                  },
                ),
              ),
            ),
            //------------------------------------------------------------------ False Button
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kYellow, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  color: kRedDark,
                  child: Text('False',
                      style: choiceMade
                          ? TextStyle(
                              fontSize: 20.0,
                              color: kTextWhtTrans,
                            )
                          : TextStyle(
                              fontSize: 20.0,
                              color: kTextWht,
                            )),
                  onPressed: () {
                    if (choiceMade == false) {
                      checkAnswer(false);
                      choiceMade = true;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        //---------------------------------------------------------------------- Feedback Text
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: kTextWhtTrans, width: 3.0),
                  color: kRedMid,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(feedbackTopText,
                        textAlign: TextAlign.center,
                        style: choiceMade
                            ? TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              )
                            : TextStyle(
                                fontSize: 22.0,
                                color: kRedMid,
                              )),
                    Divider(
                      thickness: 2.0,
                      color: choiceMade ? kYellow : kRedMid,
                    ),
                    Text(physicsQM.getFeedbackText(),
                        textAlign: TextAlign.center,
                        style: choiceMade
                            ? TextStyle(
                                fontSize: 21.0,
                                color: Colors.white,
                              )
                            : TextStyle(
                                fontSize: 21.0,
                                color: kRedMid,
                              )),
                  ],
                ),
              ),
            ),
          ),
        ),
        //---------------------------------------------------------------------- Next Button
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: kRedMid,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: kYellow, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                textColor: Colors.white,
                color: kRedDark,
                child: getNextButtonText(),
                onPressed: () {
                  if (choiceMade == true) {
                    if (physicsQM.isFinished() == 0) {
                      setState(() {
                        physicsQM.nextQuestion();
                        choiceMade = false;
                        lastQuestion = false;
                      });
                    } else if (physicsQM.isFinished() == 1) {
                      setState(() {
                        physicsQM.nextQuestion();
                        choiceMade = false;
                        lastQuestion = true;
                      });
                    } else {
                      //-------------------------------------------------------- Report Start
                      Alert(
                        context: context,
                        title: "Test Complete",
                        desc: "Results",

                        /// QUESTION DATA
                        /// Topic 1 - Energy
                        /// Topic 2 - Forces
                        /// Topic 3 - Forces and Motion
                        /// Topic 4 - Waves
                        /// Topic 5 - Electricity
                        /// Topic 6 - Magnetism and Electromagnetism
                        /// Topic 7 - Particle Model of matter
                        /// Topic 8 - Atomic structure
                        /// Topic 9 - Space Physics
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness: 3.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Energy',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(engScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Forces',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(forScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Forces and Motion',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(fomScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Waves',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(wavScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Electricity',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(elcScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Magnetism and Electromagnetism',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(magScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Particle Model of matter',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(somScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Atomic structure',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(atmScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(
                                    'Space Physics',
                                    textScaleFactor: 1.0,
                                  )),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.5),
                                      child: Container(
                                        color: kRedMid,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: convertText(spyScore),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Divider(
                              thickness: 3.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(child: Text('Another Go?')),
                          ],
                        ),
                        buttons: [
                          //---------------------------------------------------- Play Again - Yes
                          DialogButton(
                            color: kRedExtraLight,
                            child: Text(
                              "Yes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // physicsQM.restart(masterCatMapList);
                              setState(() {
                                // scoreIndicator = [];
                                testRestarted = true;
                                choiceMade = false;
                                lastQuestion = false;
                              });
                            },
                            width: 120,
                          ),
                          DialogButton(
                            color: kRedDark,
                            child: Text(
                              "No",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          ),
                        ],
                      ).show();
                    }
                  }
                },
              ),
            ),
          ),
        ),
        //---------------------------------------------------------------------- Answer Tracker
        Container(
          height: 22.0,
          child: Row(
              // children: scoreIndicator,
              ),
        ),
      ],
    );
  }

  Text getNextButtonText() {
    if (lastQuestion) {
      return Text('Finish',
          style: choiceMade
              ? TextStyle(
                  fontSize: 24.0,
                  color: kTextWht,
                )
              : TextStyle(
                  fontSize: 24.0,
                  color: kTextWhtTrans,
                ));
    } else {
      return Text('Next Question',
          style: choiceMade
              ? TextStyle(
                  fontSize: 24.0,
                  color: kTextWht,
                )
              : TextStyle(
                  fontSize: 24.0,
                  color: kTextWhtTrans,
                ));
    }
  }

  void checkAnswer(bool userPickedAnswer) {
    if (physicsQM.getAnswerBool() == userPickedAnswer) {
      correctAnswer = true;
      incrementCatScore(currentCategory);
      setFeedbackTopText();
    } else {
      correctAnswer = false;
      feedbackTopText = physicsQM.getAnswerBool().toString().toUpperCase();
    }
    setState(() {
      if (correctAnswer) {
        // scoreIndicator.add(_correct);
      } else {
        // scoreIndicator.add(_incorrect);
      }
    });
  }

  String getCategory() {
    String text;
    text = physicsQM.getCategoryText();
    currentCategory = text;
    // print('Current Cat = $text');
    return text;
  }

  /// QUESTION DATA
  /// Topic 1 - Energy
  /// Topic 2 - Forces
  /// Topic 3 - Forces and Motion
  /// Topic 4 - Waves
  /// Topic 5 - Electricity
  /// Topic 6 - Magnetism and Electromagnetism
  /// Topic 7 - Particle Model of matter
  /// Topic 8 - Atomic structure
  /// Topic 9 - Space Physics
  void incrementCatScore(String currentCat) {
    switch (currentCat) {
      case 'Energy':
        engScore++;
        break;
      case 'Forces':
        forScore++;
        break;
      case 'Forces and Motion':
        fomScore++;
        break;
      case 'Waves':
        wavScore++;
        break;
      case 'Electricity':
        elcScore++;
        break;
      case 'Magnetism and Electromagnetism':
        magScore++;
        break;
      case 'Particle Model of Matter':
        somScore++;
        break;
      case 'Atomic Structure':
        atmScore++;
        break;
      case 'Space Physics':
        spyScore++;
        break;
    }
  }

  Text convertText(int score) {
    Text convertedText;
    double dub = score / masterCatMapList['qpc'] * 100;
    int doubleToInt = dub.toInt();
    convertedText = Text('$doubleToInt%',
        textAlign: TextAlign.end,
        style: TextStyle(color: kTextWht, fontSize: 17.0));
    return convertedText;
  }

  void setFeedbackTopText() {
    List<String> encourageList = [
      'Correct',
      'Well Done',
      'You are Right',
      'That\'s Correct',
      'Yes',
      'Super',
      'Good Answer'
    ];
    int feedbackTopTextChoice = Random().nextInt(encourageList.length);
    feedbackTopText = encourageList[feedbackTopTextChoice];
  }
}
