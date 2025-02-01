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

Future<dynamic> pickHeight(
  BuildContext context,
  String? initialUnit,
  int? initialValue,
  int? cmMin,
  int? cmMax,
  int? ftMin,
  int? ftMax,
  Color? backgroundColor,
) async {
  initialValue = initialValue ?? 180;
  initialUnit = initialUnit ?? 'cm';
  String selectedUnit = initialUnit;
  int selectedValue = initialValue;
  int selectedCmValue = initialUnit == 'cm' ? initialValue : 0;
  int selectedInValue = initialUnit == 'ft+in' ? initialValue : 0;
  int selectedFtValue = 0;

  final Map<String, List<int>> unitRanges = {
    'cm': List<int>.generate(
        (cmMax ?? 250) - (cmMin ?? 50) + 1, (i) => (cmMin ?? 50) + i),
    'ft+in': List<int>.generate(
        (ftMax ?? 9) - (ftMin ?? 2) + 1, (i) => (ftMin ?? 2) + i),
  };

  Future<Map<String, dynamic>?> _showPickerPopup() async {
    return await showCupertinoModalPopup<Map<String, dynamic>>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 300,
            color: backgroundColor,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CupertinoPicker(
                          backgroundColor: backgroundColor,
                          itemExtent: 40.0,
                          scrollController: FixedExtentScrollController(
                            initialItem: selectedUnit == 'cm'
                                ? unitRanges[selectedUnit]!
                                    .indexOf(selectedCmValue)
                                : unitRanges['ft+in']!.indexOf(selectedFtValue),
                          ),
                          onSelectedItemChanged: (int index) {
                            setState(() {
                              if (selectedUnit == 'cm') {
                                selectedCmValue =
                                    unitRanges[selectedUnit]![index];
                              } else {
                                selectedFtValue = unitRanges['ft+in']![index];
                                selectedInValue =
                                    0; // Reset inches when feet changes
                              }
                            });
                          },
                          children: selectedUnit == 'cm'
                              ? unitRanges[selectedUnit]!
                                  .map((value) => Center(child: Text('$value')))
                                  .toList()
                              : unitRanges['ft+in']!
                                  .map((value) => Center(child: Text('$value')))
                                  .toList(),
                        ),
                      ),
                      if (selectedUnit == 'ft+in')
                        Expanded(
                          flex: 1,
                          child: CupertinoPicker(
                            backgroundColor: backgroundColor,
                            itemExtent: 40.0,
                            scrollController: FixedExtentScrollController(
                              initialItem: selectedInValue,
                            ),
                            onSelectedItemChanged: (int index) {
                              setState(() {
                                selectedInValue = index;
                              });
                            },
                            children: List<int>.generate(12, (i) => i)
                                .map((value) => Center(child: Text('$value')))
                                .toList(),
                          ),
                        ),
                      Expanded(
                        flex: 1,
                        child: CupertinoPicker(
                          backgroundColor: backgroundColor,
                          itemExtent: 40.0,
                          scrollController: FixedExtentScrollController(
                            initialItem:
                                unitRanges.keys.toList().indexOf(initialUnit!),
                          ),
                          onSelectedItemChanged: (int index) {
                            setState(() {
                              selectedUnit = unitRanges.keys.elementAt(index);
                              if (selectedUnit == 'cm') {
                                selectedCmValue =
                                    unitRanges[selectedUnit]!.first;
                              } else {
                                selectedFtValue = unitRanges['ft+in']!.first;
                                selectedInValue =
                                    0; // Reset inches when switching to feet
                              }
                            });
                          },
                          children: unitRanges.keys
                              .map((unit) => Center(child: Text(unit)))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  child: Text('Submit'),
                  onPressed: () {
                    int selectedValue;
                    if (selectedUnit == 'cm') {
                      selectedValue = selectedCmValue;
                    } else {
                      selectedValue = selectedFtValue * 12 + selectedInValue;
                    }
                    Navigator.of(context).pop({
                      'unit': selectedUnit,
                      'value': selectedValue,
                    });
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

  final output = await _showPickerPopup();
  return output ??
      {
        'unit': initialUnit,
        'value': initialValue,
      };
}
