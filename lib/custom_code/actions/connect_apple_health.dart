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

import 'index.dart'; // Imports other custom actions

// This action authenticates Apple Health or Google Fit, depending on the device

// Apple Health does not provide information on permissions to read data due to security
// concerns. Consequently, the "requested" status will always return true for iOS

// DO THIS FIRST

// Follow the manual on https://pub.dev/packages/health:

// APPLE:

// 1)
// Add the following in Settings -> Permissions in FlutterFlow. This replaces the
// need to manually adjust the Info.plist (see an older project how to do this)

// 2)
// Enable Healthkit when creating app identifier at https://developer.apple.com/account/resources
// OR
// When launching app locally, enable "HealthKit" by adding a capability inside
// the "Signing & Capabilities" tab of the Runner target's settings

// ANDROID:

// 1)
// Download the code and open in VS Code or similar
// Go to the android subfolder (cd ~/.android/)
// Run the following in command line:
// keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

// IMPORTANT:
// The above needs to be done for the debug and release version of the app separately
// FF sets the app's status to debug by default, which allows the user to run the app locally
// without proper signing. When publishing to Google Play Store, this needs to be changed
// (it is done automatically if deploying through FF or needs to be done manually if deploying
// manually or from a Github repo through FF). (This is changed in android/app/build.gradle,
// switching from signingConfig signingConfigs.debug to signingConfig signingConfigs.release.)
// Running the command with the release version will likely still provide the same debug identifier
// To get the release one, go to Google Play Store (once the app has been published to at least internal testing)
// -> App integrity -> App signing and use this one

// 2)
// Go to https://developers.google.com/fit/android/get-api-key
// Click on "Get a client ID"
// Once the Fitness API is enabled, search for APIs and services
// Go to "OAuth consent screen" and create a screen/app there
// Publish the app or add test users
// Go to Credentials and click Create Credentials -> OAuth Client ID
// Application type: Android
// Use your app's package name (e.g. "com.vitality.uk.flutter.example") and use the SHA-1
// certificate obtained in the previous step

// 3)
// Add the following in FlutterFlow's Settings -> Permissions:
//  <uses-permission android:name="android.permission.ACTIVITY_RECOGNITION"/>
//  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
//  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>

import 'dart:async';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> connectAppleHealth(List<String> dataTypes) async {
  Health().configure(useHealthConnectIfAvailable: true);

  // define the types to get
  var types = [
    HealthDataType.STEPS,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    // HealthDataType.HEART_RATE,
    HealthDataType.MINDFULNESS,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_ASLEEP_REM,
    HealthDataType.SLEEP_ASLEEP_DEEP,
    HealthDataType.SLEEP_ASLEEP_CORE,
    HealthDataType.WORKOUT,
    HealthDataType.RESTING_HEART_RATE,
    HealthDataType.VO2MAX,
    HealthDataType.BODY_FAT_PERCENTAGE,
    HealthDataType.BODY_MASS_INDEX,
    HealthDataType.HEIGHT,
    HealthDataType.WEIGHT,
    HealthDataType.WAIST_CIRCUMFERENCE,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.HEART_RATE_VARIABILITY_SDNN,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.AUDIOGRAM,
    HealthDataType.BODY_TEMPERATURE,
    // HealthDataType.BODY_WATER_MASS, // Google Health Connect only
    HealthDataType.DIETARY_CARBS_CONSUMED,
    HealthDataType.DIETARY_CAFFEINE,
    HealthDataType.DIETARY_ENERGY_CONSUMED,
    HealthDataType.DIETARY_FATS_CONSUMED,
    HealthDataType.DIETARY_PROTEIN_CONSUMED,
    HealthDataType.FORCED_EXPIRATORY_VOLUME,
    HealthDataType.TIME_IN_DAYLIGHT,
    HealthDataType.RESPIRATORY_RATE,
    HealthDataType.PERIPHERAL_PERFUSION_INDEX,
    HealthDataType.WALKING_HEART_RATE,
    HealthDataType.DISTANCE_WALKING_RUNNING,
    HealthDataType.DISTANCE_SWIMMING,
    HealthDataType.DISTANCE_CYCLING,
    HealthDataType.FLIGHTS_CLIMBED,
    HealthDataType.MOVE_MINUTES, // Google Fit only
    HealthDataType.DISTANCE_DELTA, // Google Fit and Google Health Connect only
    HealthDataType.WATER,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
    HealthDataType.SLEEP_OUT_OF_BED,
    HealthDataType.SLEEP_SESSION,
    HealthDataType.EXERCISE_TIME,
    HealthDataType.HEADACHE_NOT_PRESENT,
    HealthDataType.HEADACHE_MILD,
    HealthDataType.HEADACHE_MODERATE,
    HealthDataType.HEADACHE_SEVERE,
    HealthDataType.HEADACHE_UNSPECIFIED,
    HealthDataType.NUTRITION,
    HealthDataType.HIGH_HEART_RATE_EVENT,
    HealthDataType.LOW_HEART_RATE_EVENT,
    HealthDataType.IRREGULAR_HEART_RATE_EVENT,
    // HealthDataType.ELECTRODERMAL_ACTIVITY,
    // HealthDataType.ELECTROCARDIOGRAM,
  ];

  var permissions = <HealthDataAccess>[
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    // HealthDataAccess.READ,
    // HealthDataAccess.READ,
    // HealthDataAccess.READ,
    // HealthDataAccess.READ,
    HealthDataAccess.READ
  ];

  // Requesting access to the data types before reading them
  // bool requested = await health.requestAuthorization(types);

  bool requested =
      await Health().requestAuthorization(types, permissions: permissions);

  // These are just for Android
  // These can be excluded if workouts are not requested
  // await Permission.activityRecognition.request();
  // await Permission.location.request();

  return requested;
}
