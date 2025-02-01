// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/cupertino.dart';

Future<int> pickInteger(
  BuildContext context,
  int? initialValue,
  int? min,
  int? max,
  Color? backgroundColor,
) async {
  initialValue = initialValue ?? 0;
  int selectedValue = initialValue;

  Future<int?> showPickerPopup() async {
    return await showCupertinoModalPopup<int>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 300,
            color: backgroundColor,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    backgroundColor: backgroundColor,
                    itemExtent: 40.0,
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedValue,
                    ),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedValue = index;
                      });
                    },
                    children: List<int>.generate((max ?? 100) - (min ?? 0) + 1,
                            (i) => (min ?? 0) + i)
                        .map((value) => Center(child: Text('$value')))
                        .toList(),
                  ),
                ),
                CupertinoButton(
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.of(context).pop(selectedValue);
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }

  final output = await showPickerPopup();
  return output ?? initialValue;
}
