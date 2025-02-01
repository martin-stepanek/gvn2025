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

Future<dynamic> pickWeight(
  BuildContext context,
  String? initialUnit,
  int? initialValue,
  int? kgMin,
  int? kgMax,
  int? lbMin,
  int? lbMax,
  Color? backgroundColor,
) async {
  initialValue = initialValue ?? 100;
  initialUnit = initialUnit ?? 'kg';
  String selectedUnit = initialUnit;
  int selectedValue = initialValue;

  final Map<String, List<int>> unitRanges = {
    'kg': List<int>.generate(
        (kgMax ?? 250) - (kgMin ?? 50) + 1, (i) => (kgMin ?? 50) + i),
    'lb': List<int>.generate(
        (lbMax ?? 500) - (lbMin ?? 50) + 1, (i) => (lbMin ?? 50) + i),
  };

  Future<Map<String, dynamic>?> showPickerPopup() async {
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
                            initialItem: unitRanges[selectedUnit]!
                                .indexOf(selectedValue),
                          ),
                          onSelectedItemChanged: (int index) {
                            setState(() {
                              selectedValue = unitRanges[selectedUnit]![index];
                            });
                          },
                          children: unitRanges[selectedUnit]!
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
                              selectedValue = unitRanges[selectedUnit]!.first;
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

  final output = await showPickerPopup();
  return output ?? {'unit': initialUnit, 'value': initialValue};
}
