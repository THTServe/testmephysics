import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testmephysics/screens/InfoScreen.dart';
import 'package:testmephysics/utilities/constants.dart';
import 'package:testmephysics/utilities/physics_quiz_master.dart';

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

PhysicsQuizMaster physicsQM = PhysicsQuizMaster();
const forcesIcon = IconData(0xf41f,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
const matterIcon = IconData(0xf450,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
const atomIcon = IconData(0xf44e,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
const spaceIcon = IconData(0xf38c,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);

class SelectionScreen extends StatefulWidget {
  final Map catMapList;

  SelectionScreen({@required this.catMapList});

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  var _localCatMapList = Map<String, dynamic>();
  int selectionCount = 0;

  @override
  Widget build(BuildContext context) {
    _localCatMapList = widget.catMapList;
    // print(widget.questionsPerCat);
    getAmountSelected();
    return WillPopScope(
      onWillPop: () async => true,
      child: ListView(
        children: [
          _header(),
          DrawerItem(
              isSelected: _localCatMapList['eng'],
              icon: Icons.whatshot,
              text: 'Energy',
              onTap: () {
                setState(() {
                  _localCatMapList['eng'] = !_localCatMapList['eng'];
                });
              }),
          DrawerItem(
              isSelected: _localCatMapList['for'],
              icon: forcesIcon,
              text: 'Forces',
              onTap: () {
                setState(() {
                  _localCatMapList['for'] = !_localCatMapList['for'];
                });
              }),
          DrawerItem(
              isSelected: _localCatMapList['fom'],
              icon: Icons.forward,
              text: 'Forces & Motion',
              onTap: () {
                setState(() {
                  _localCatMapList['fom'] = !_localCatMapList['fom'];
                });
              }),
          DrawerItem(
              isSelected: _localCatMapList['wav'],
              icon: Icons.wifi,
              text: 'Waves',
              onTap: () {
                setState(() {
                  _localCatMapList['wav'] = !_localCatMapList['wav'];
                });
              }),
          DrawerItem(
              isSelected: _localCatMapList['elc'],
              icon: Icons.wb_incandescent,
              text: 'Electricity',
              onTap: () {
                setState(() {
                  _localCatMapList['elc'] = !_localCatMapList['elc'];
                });
              }),
          DrawerItem(
              isSelected: _localCatMapList['mag'],
              icon: Icons.wb_iridescent,
              text: 'Magnetism & Electromagnetism',
              onTap: () {
                setState(() {
                  _localCatMapList['mag'] = !_localCatMapList['mag'];
                });
              }),
          DrawerItem(
              isSelected: _localCatMapList['som'],
              icon: matterIcon,
              text: 'Particle Model of Matter',
              onTap: () {
                setState(() {
                  _localCatMapList['som'] = !_localCatMapList['som'];
                });
              }),
          DrawerItem(
              isSelected: _localCatMapList['atm'],
              icon: atomIcon,
              text: 'Atomic Structure',
              onTap: () {
                setState(() {
                  _localCatMapList['atm'] = !_localCatMapList['atm'];
                });
              }),
          DrawerItem(
              isSelected: _localCatMapList['spy'],
              icon: spaceIcon,
              text: 'Space Physics',
              onTap: () {
                setState(() {
                  _localCatMapList['spy'] = !_localCatMapList['spy'];
                });
              }),

          //---------------------------------------------------------------------- Questions Per Category
          Container(
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        child: Text(
                          'Questions/Category:',
                          style: TextStyle(fontSize: 20.0, color: kTextWht),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (_localCatMapList['qpc'] > 1) {
                            setState(() {
                              _localCatMapList['qpc']--;
                            });
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.remove_circle,
                            color: kTextWht,
                            size: 30.0,
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          _localCatMapList['qpc'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kTextWht, fontSize: 20.0),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          if (_localCatMapList['qpc'] < 10) {
                            setState(() {
                              _localCatMapList['qpc']++;
                            });
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.add_circle,
                            color: kTextWht,
                            size: 30.0,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _cancelButton(context),
              _restartButton(context),
            ],
          )
        ],
      ),
    );
  }

  Padding _restartButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 175.0,
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
          child: Text(
            'Restart',
            style: TextStyle(color: kTextWht, fontSize: 22.0),
          ),
          onPressed: () {
            AlertDialog thisAlert = AlertDialog(
              backgroundColor: kTextWht,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: Text('Invalid Selection'),
              content: Text('Please Select at least one Category'),
              actions: [
                Container(
                  // color: kRedDark,
                  height: 35.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: kYellow, width: 3.0),
                      color: kRedMid,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Dismiss',
                        style: TextStyle(color: kTextWht, fontSize: 18.0),
                      )),
                )
              ],
            );
            if (getAmountSelected() < 1) {
              showDialog(context: context, builder: (_) => thisAlert);
            } else {
              // physicsQM.resetQPC(questionsPerCat);
              // Adding the questions for category to the Map to pass back.
              // _localCatMapList['qpc'] = localQPC;
              Navigator.pop(context, _localCatMapList);
            }
          },
        ),
      ),
    );
  }

  //---------------------------------------------------------------------------- Header
  Widget _header() {
    return Column(children: <Widget>[
      SizedBox(height: 100.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text("Select Categories",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kYellow,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Pacifico',
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoScreen()));
              },
              child: Icon(
                Icons.info,
                color: kTextWht,
                size: 32.0,
              ),
            ),
          )
        ],
      ),
    ]);
  }

  /// Used to check to see if the user is trying to select zero categories
  int getAmountSelected() {
    int _count = 0;
    _localCatMapList.forEach((key, value) {
      //Account here for one of the entries in the list not being a selection of
      // category
      if (key != 'qpc') {
        if (value) {
          _count++;
        }
      }
      // print(key);
      // print(value);
      // print(selectionCount);
    });
    return _count;
  }

  _cancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 175.0,
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
          child: Text(
            'Cancel',
            style: TextStyle(color: kTextWht, fontSize: 22.0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String text;
  final Function onTap;

  DrawerItem({this.isSelected, this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        color: kTextWhtTrans,
        child: ListTile(
          dense: true,
          // tileColor: kTextWhtTrans,
          title: Row(
            children: <Widget>[
              Icon(
                icon,
                color: isSelected ? kTextWht : kTextWhtTrans,
                size: 40.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  text,
                  style: isSelected
                      ? TextStyle(color: kTextWht, fontSize: 21.0)
                      : TextStyle(color: kTextWhtTrans, fontSize: 21.0),
                ),
              )
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
