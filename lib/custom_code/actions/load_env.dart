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

// Load the .env file with private credentials

// ADD "- .env" TO pubspec.yaml under assets!
// flutter:
//  assets:
//    - .env

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future loadEnv() async {
  await dotenv.load(fileName: ".env");
}
