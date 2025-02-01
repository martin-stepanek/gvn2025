// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// This widget requires a local variable "state" (JSON) to be created
// Initialise state = {} in FF

// See https://community.flutterflow.io/c/community-custom-widgets/international-phone-number-entry for the idea

class CustomRadioButtonSet extends StatefulWidget {
  const CustomRadioButtonSet({
    Key? key,
    this.width,
    this.height, // Not required; height is set automaically for the buttons to fit
    required this.unselectedColor,
    required this.selectedColor,
    // required this.buttonTexts,
    // required this.buttonValues,
    required this.id,
    required this.state,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
    this.text7,
    this.text8,
    this.text9,
    this.text10,
    required this.action, // An action needs to be provided. This can be just clearing a local state value
  }) : super(key: key);

  final double? width;
  final double? height;
//   final List<String> buttonTexts; // Text to show on buttons (list)
//   final List<String> buttonValues; // Values to store on click (list)
  final Color unselectedColor;
  final Color selectedColor;
  final String id; // Identifier within the "state" variable
  final dynamic state; // Local variable that the results are saved to
  final Future<dynamic> Function() action;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? text5;
  final String? text6;
  final String? text7;
  final String? text8;
  final String? text9;
  final String? text10;

  @override
  _CustomRadioButtonSetState createState() => _CustomRadioButtonSetState();
}

class _CustomRadioButtonSetState extends State<CustomRadioButtonSet> {
  String selected = "";

  // Set up the button class. We create the individual buttons below

  Widget CustomRadioButton(String text, String value) {
    return OutlinedButton(
      // key: Key(widget.keyName),

      onPressed: () {
        setState(() {
          //widget.selectedValue = value;
        });
        selected = value; // To highlight the selected button
        if (widget.state[widget.id] == null)
          widget.state[widget.id] = <String, dynamic>{};
        widget.state[widget.id]['selected'] = value; // To store the value
        widget.action(); // This is required to update the page
      },
      child: Row(children: [
        Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: FlutterFlowTheme.of(context).bodyText1.color,
            fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
            fontSize: FlutterFlowTheme.of(context).bodyText1.fontSize,
            fontWeight:
                (selected == value) ? FontWeight.w600 : FontWeight.normal,
          ),
        )
      ]),
      style: OutlinedButton.styleFrom(
          minimumSize: Size(widget.width ?? 200, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: (selected == value)
              ? widget.selectedColor.withOpacity(0.10)
              : widget.unselectedColor.withOpacity(0),
          side: BorderSide(
              color: (selected == value)
                  ? widget.selectedColor
                  : widget.unselectedColor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<String> texts = widget.buttonTexts;
    // List<String> values = widget.buttonValues;

    List<String?> texts = <String>[];

    if (widget.text1 != null && widget.text1 != " ") texts.add(widget.text1);
    if (widget.text2 != null && widget.text2 != " ") texts.add(widget.text2);
    if (widget.text3 != null && widget.text3 != " ") texts.add(widget.text3);
    if (widget.text4 != null && widget.text4 != " ") texts.add(widget.text4);
    if (widget.text5 != null && widget.text5 != " ") texts.add(widget.text5);
    if (widget.text6 != null && widget.text6 != " ") texts.add(widget.text6);
    if (widget.text7 != null && widget.text7 != " ") texts.add(widget.text7);
    if (widget.text8 != null && widget.text8 != " ") texts.add(widget.text8);
    if (widget.text9 != null && widget.text9 != " ") texts.add(widget.text9);
    if (widget.text10 != null && widget.text10 != " ") texts.add(widget.text10);

    // Generate the buttons
    return Column(
      children: List.generate(texts.length, (i) {
        final text = texts[i];
        // final value = values[i];
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          // child: CustomRadioButton(text, value),
          child: CustomRadioButton(text!, text),
        );
      }, growable: false),
    );
  }
}
