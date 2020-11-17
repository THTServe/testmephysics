import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

///COLOURS
const kRedDark = Color(0xFF880e4f);
const kRedMid = Color(0xFFad1457);
const kRedLight = Color(0xFFc2185b);
const kRedExtraLight = Color(0xFFec407a);
const kBlkLight = Color(0xFF2a1717);
const kYellow = Color(0xFFFFBA00);
const kBlue = Color(0xFF028DFD);
const kTeal = Color(0xFF1FC9B2);
const kTextWht = Color(0xFFFFFFFF);
const kTextWhtTrans = Color(0x66FFFFFF);

/// Box Decoration
BoxDecoration buildTileDecoration() {
  return BoxDecoration(
      color: kRedDark,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
      boxShadow: [buildBoxShadow()]);
}

BoxShadow buildBoxShadow() {
  return BoxShadow(
      color: Colors.grey[600], blurRadius: 8.0, offset: Offset(1.0, 4.0));
}

var alertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.center,
  animationDuration: Duration(milliseconds: 300),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    side: BorderSide(color: kYellow, width: 3.0),
  ),
  titleStyle: TextStyle(
    color: Colors.red,
  ),
  alertAlignment: Alignment.bottomCenter,
);
