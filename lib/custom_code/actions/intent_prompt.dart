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

import '/auth/firebase_auth/auth_util.dart';

dynamic intentPrompt(String? intent) async {
  List<Map<String, String>> intentPrompt = [];
  String instructions = '';

  if (intent == 'Set a daily step goal for me.') {
    List<PaDataRecord> paData = await queryPaDataRecordOnce(
      parent: currentUserReference,
      queryBuilder: (paDataRecord) => paDataRecord.where(Filter.or(
        Filter(
          'data_type',
          isEqualTo: 'daily',
        ),
        Filter(
          'steps',
          isGreaterThan: 0,
        ),
      )),
    );

    // Get summary statistics
    int totalSteps = 0;
    List<int> stepsList = [];
    for (var record in paData) {
      stepsList.add(record.steps);
      totalSteps += record.steps;
    }
    stepsList.sort();
    int stepsAverage = paData.isNotEmpty ? totalSteps ~/ paData.length : 0;
    int stepsP10 = stepsList[(stepsList.length * 0.10).toInt()];
    int stepsP25 = stepsList[(stepsList.length * 0.25).toInt()];
    int stepsP50 = stepsList[(stepsList.length * 0.50).toInt()];
    int stepsP75 = stepsList[(stepsList.length * 0.75).toInt()];
    int stepsP90 = stepsList[(stepsList.length * 0.90).toInt()];

    instructions = """
      My characteristics:
      - gender: ${currentUserDocument?.gender?.name ?? 'unknown'}
      - age: ${currentUserDocument?.age ?? 'unknown'}
      ---
      My activity summary from my activity tracker (daily steps):
      - total days observed: ${paData.length}
      - average steps: ${stepsAverage == 0 ? 'unknown' : stepsAverage}
      - 10th percentile: ${stepsP10 == 0 ? 'unknown' : stepsP10}
      - 25th percentile: ${stepsP25 == 0 ? 'unknown' : stepsP25}
      - 50th percentile: ${stepsP50 == 0 ? 'unknown' : stepsP50}
      - 75th percentile: ${stepsP75 == 0 ? 'unknown' : stepsP75}
      - 90th percentile: ${stepsP90 == 0 ? 'unknown' : stepsP90}
      ---
      You must provide a daily step goal for me based on the information above.
      The step goal should be challenging but achievable on most days.
      Provide an explanation for the user on why you chose this goal and how it can benefit me.
      Use maximum 200 words and get straight to the point.
      """;
  } else if (intent == 'What can you tell me about my sleep?') {
    List<PaDataRecord> paData = await queryPaDataRecordOnce(
      parent: currentUserReference,
      queryBuilder: (paDataRecord) => paDataRecord.where(Filter.or(
        Filter(
          'data_type',
          isEqualTo: 'daily',
        ),
        Filter(
          'sleep_total',
          isGreaterThan: 0,
        ),
      )),
    );

    // Get summary statistics
    int totalSleep = 0;
    int totalDeepSleep = 0;
    int totalLightSleep = 0;
    int totalRemSleep = 0;
    int totalAwakeSleep = 0;
    List<int> sleepList = [];
    for (var record in paData) {
      sleepList.add(record.sleepTotal);
      totalSleep += record.sleepTotal;
      totalDeepSleep += record.sleepDeep;
      totalLightSleep += record.sleepLight;
      totalRemSleep += record.sleepRem;
      totalAwakeSleep += record.sleepAwake;
    }
    sleepList.sort();
    double sleepAverage =
        paData.isNotEmpty ? totalSleep / paData.length / 60 : 0;
    double deepsleepAverage =
        paData.isNotEmpty ? totalDeepSleep / paData.length / 60 : 0;
    double lightsleepAverage =
        paData.isNotEmpty ? totalLightSleep / paData.length / 60 : 0;
    double remsleepAverage =
        paData.isNotEmpty ? totalRemSleep / paData.length / 60 : 0;
    double awakesleepAverage =
        paData.isNotEmpty ? totalAwakeSleep / paData.length / 60 : 0;
    double sleepP10 = sleepList[(sleepList.length * 0.10).toInt()] / 60;
    double sleepP25 = sleepList[(sleepList.length * 0.25).toInt()] / 60;
    double sleepP50 = sleepList[(sleepList.length * 0.50).toInt()] / 60;
    double sleepP75 = sleepList[(sleepList.length * 0.75).toInt()] / 60;
    double sleepP90 = sleepList[(sleepList.length * 0.90).toInt()] / 60;

    instructions = """
      My characteristics:
      - gender: ${currentUserDocument?.gender?.name ?? 'unknown'}
      - age: ${currentUserDocument?.age ?? 'unknown'}
      ---
      My activity summary from my activity tracker:
      - total days observed: ${paData.length}
      - average sleep length per day: ${sleepAverage == 0 ? 'unknown' : sleepAverage} hours
      - 10th percentile: ${sleepP10 == 0 ? 'unknown' : sleepP10} hours
      - 25th percentile: ${sleepP25 == 0 ? 'unknown' : sleepP25} hours
      - 50th percentile: ${sleepP50 == 0 ? 'unknown' : sleepP50} hours
      - 75th percentile: ${sleepP75 == 0 ? 'unknown' : sleepP75} hours
      - 90th percentile: ${sleepP90 == 0 ? 'unknown' : sleepP90} hours
      - average deep sleep: ${deepsleepAverage == 0 ? 'unknown' : deepsleepAverage} hours
      - average light sleep: ${lightsleepAverage == 0 ? 'unknown' : lightsleepAverage} hours
      - average REM sleep: ${remsleepAverage == 0 ? 'unknown' : remsleepAverage} hours
      - average awake sleep: ${awakesleepAverage == 0 ? 'unknown' : awakesleepAverage} hours
      ---
      You must provide a summary of my sleep patterns in an easily understandable way. 
      Use maximum 200 words and get straight to the point.
      """;
  } else if (intent == 'How is my stress readiness?') {
    List<PaDataRecord> paData = await queryPaDataRecordOnce(
      parent: currentUserReference,
      queryBuilder: (paDataRecord) => paDataRecord.where(Filter.or(
        Filter(
          'data_type',
          isEqualTo: 'daily',
        ),
        Filter(
          'hrv_daily',
          isGreaterThan: 0,
        ),
      )),
    );

    // Get summary statistics
    double totalHrv = 0.0;
    List<double> hrvList = [];
    for (var record in paData) {
      hrvList.add(record.hrvDaily);
      totalHrv += record.hrvDaily;
    }
    hrvList.sort();
    double hrvAverage = paData.isNotEmpty ? totalHrv / paData.length * 1.0 : 0;
    double hrvP10 = hrvList[(hrvList.length * 0.10).toInt()];
    double hrvP25 = hrvList[(hrvList.length * 0.25).toInt()];
    double hrvP50 = hrvList[(hrvList.length * 0.50).toInt()];
    double hrvP75 = hrvList[(hrvList.length * 0.75).toInt()];
    double hrvP90 = hrvList[(hrvList.length * 0.90).toInt()];

    instructions = """
      My characteristics:
      - gender: ${currentUserDocument?.gender?.name ?? 'unknown'}
      - age: ${currentUserDocument?.age ?? 'unknown'}
      ---
      My activity summary from my activity tracker:
      - total days observed: ${paData.length}
      - average heart rate variability (SDNN): ${hrvAverage == 0 ? 'unknown' : hrvAverage}
      - 10th percentile: ${hrvP10 == 0 ? 'unknown' : hrvP10}
      - 25th percentile: ${hrvP25 == 0 ? 'unknown' : hrvP25}
      - 50th percentile: ${hrvP50 == 0 ? 'unknown' : hrvP50}
      - 75th percentile: ${hrvP75 == 0 ? 'unknown' : hrvP75}
      - 90th percentile: ${hrvP90 == 0 ? 'unknown' : hrvP90}
      ---
      You must provide a summary of what my heart rate variability patterns mean for my stress readiness in an easily understandable way.
      Use maximum 200 words and get straight to the point.
      """;
  } else if (intent == 'How would you describe my activity level?') {
    List<PaDataRecord> paData = await queryPaDataRecordOnce(
      parent: currentUserReference,
      queryBuilder: (paDataRecord) => paDataRecord.where(Filter.or(
        Filter(
          'data_type',
          isEqualTo: 'daily',
        ),
        Filter(
          'steps',
          isGreaterThan: 0,
        ),
      )),
    );

    List<PaDataRecord> workoutData = await queryPaDataRecordOnce(
      parent: currentUserReference,
      queryBuilder: (paDataRecord) => paDataRecord.where(Filter.or(
        Filter(
          'data_type',
          isEqualTo: 'workout',
        ),
        Filter(
          'workout_duration',
          isGreaterThan: 0,
        ),
      )),
    );

    // Get summary statistics
    int totalSteps = 0;
    List<int> stepsList = [];
    for (var record in paData) {
      stepsList.add(record.steps);
      totalSteps += record.steps;
    }
    stepsList.sort();
    int stepsAverage = paData.isNotEmpty ? totalSteps ~/ paData.length : 0;
    int stepsP10 = stepsList[(stepsList.length * 0.10).toInt()];
    int stepsP25 = stepsList[(stepsList.length * 0.25).toInt()];
    int stepsP50 = stepsList[(stepsList.length * 0.50).toInt()];
    int stepsP75 = stepsList[(stepsList.length * 0.75).toInt()];
    int stepsP90 = stepsList[(stepsList.length * 0.90).toInt()];

    double totalWorkoutDuration = 0;
    int totalWorkoutCalories = 0;
    int totalWorkouts = workoutData.length;
    List<double> workoutDurationList = [];
    List<int> workoutCaloriesList = [];
    for (var record in workoutData) {
      totalWorkoutDuration += record.workoutDuration;
      totalWorkoutCalories += record.workoutCalories;
      workoutDurationList.add(record.workoutDuration);
      workoutCaloriesList.add(record.workoutCalories);
    }
    workoutDurationList.sort();
    workoutCaloriesList.sort();
    double workoutDurationAverage =
        workoutData.isNotEmpty ? totalWorkoutDuration / workoutData.length : 0;
    double workoutCaloriesAverage =
        workoutData.isNotEmpty ? totalWorkoutCalories / workoutData.length : 0;
    double workoutDurationP50 =
        workoutDurationList[(workoutDurationList.length * 0.50).toInt()];
    int workoutCaloriesP50 =
        workoutCaloriesList[(workoutCaloriesList.length * 0.50).toInt()];

    instructions = """
      My characteristics:
      - gender: ${currentUserDocument?.gender?.name ?? 'unknown'}
      - age: ${currentUserDocument?.age ?? 'unknown'}
      ---
      My activity summary from my activity tracker (daily steps):
      - total days observed: ${paData.length}
      - average steps: ${stepsAverage == 0 ? 'unknown' : stepsAverage}
      - 10th percentile: ${stepsP10 == 0 ? 'unknown' : stepsP10}
      - 25th percentile: ${stepsP25 == 0 ? 'unknown' : stepsP25}
      - 50th percentile: ${stepsP50 == 0 ? 'unknown' : stepsP50}
      - 75th percentile: ${stepsP75 == 0 ? 'unknown' : stepsP75}
      - 90th percentile: ${stepsP90 == 0 ? 'unknown' : stepsP90}
      ---
      My activity summary from my activity tracker (workouts):
      - total workouts in the ${paData.length} days observed: $totalWorkouts
      - average workout duration: ${workoutDurationAverage == 0 ? 'unknown' : workoutDurationAverage}
      - median workout duration: ${workoutDurationP50 == 0 ? 'unknown' : workoutDurationP50}
      - average workout calories burned: ${workoutCaloriesAverage == 0 ? 'unknown' : workoutCaloriesAverage}
      - median workout calories burned: ${workoutCaloriesP50 == 0 ? 'unknown' : workoutCaloriesP50}
      ---
      You must provide me with a summary of my activity level based on the information above. The information should be easily understandable and end up with a recommendation for the future.
      Use maximum 200 words and get straight to the point.
      """;
  } else if (intent == 'How do I rank in terms of fitness?') {
    List<PaDataRecord> paData = await queryPaDataRecordOnce(
      parent: currentUserReference,
      queryBuilder: (paDataRecord) => paDataRecord.where(Filter.or(
        Filter(
          'data_type',
          isEqualTo: 'daily',
        ),
        Filter(
          'vo2_max',
          isGreaterThan: 0,
        ),
      )),
    );

    // Get summary statistics
    double totalVo2Max = 0.0;
    for (var record in paData) {
      totalVo2Max += record.vo2Max;
    }
    double vo2MaxAverage =
        paData.isNotEmpty ? totalVo2Max / paData.length * 1.0 : 0;

    instructions = """
      My characteristics:
      - gender: ${currentUserDocument?.gender?.name ?? 'unknown'}
      - age: ${currentUserDocument?.age ?? 'unknown'}
      ---
      My activity summary from my activity tracker:
      - total days observed: ${paData.length}
      - average VO2 max for the observed period: ${vo2MaxAverage == 0 ? 'unknown' : vo2MaxAverage}
      ---
      You must provide a summary of what my observed VO2 max says about my fitness. Specifically, you should compare my VO2 max to the general population for my age and gender and provide a recommendation for the future.
      Use maximum 200 words and get straight to the point.
      """;
  } else if (intent == 'What can you tell me about my overall health?') {
    List<PaDataRecord> paData = await queryPaDataRecordOnce(
      parent: currentUserReference,
      queryBuilder: (paDataRecord) => paDataRecord.where(Filter.or(
        Filter(
          'data_type',
          isEqualTo: 'daily',
        ),
        Filter(
          'steps',
          isGreaterThan: 0,
        ),
      )),
    );

    // Get summary statistics
    List<double> hrvList = [];
    List<int> stepsList = [];
    List<int> sleepList = [];
    double totalHrv = 0.0;
    int totalSleep = 0;
    int totalSteps = 0;
    double totalVo2Max = 0.0;
    double totalSpo2 = 0.0;
    double totalRestingHR = 0.0;
    int vo2MaxCount = 0;
    int spo2Count = 0;
    int restingHRCount = 0;
    int sleepCount = 0;
    int hrvCount = 0;
    for (var record in paData) {
      totalSpo2 += record.spo2Avg;
      totalRestingHR += record.heartRateResting;
      totalVo2Max += record.vo2Max;
      stepsList.add(record.steps);
      totalSteps += record.steps;
      sleepList.add(record.sleepTotal);
      totalSleep += record.sleepTotal;
      hrvList.add(record.hrvDaily);
      totalHrv += record.hrvDaily;
      if (record.vo2Max > 0) {
        vo2MaxCount++;
      }
      if (record.spo2Avg > 0) {
        spo2Count++;
      }
      if (record.heartRateResting > 0) {
        restingHRCount++;
      }
      if (record.sleepTotal > 0) {
        sleepCount++;
      }
      if (record.hrvDaily > 0) {
        hrvCount++;
      }
    }
    stepsList.sort();
    sleepList.sort();
    hrvList.sort();
    double hrvP10 = hrvList[(hrvList.length * 0.10).toInt()];
    double hrvP50 = hrvList[(hrvList.length * 0.50).toInt()];
    double hrvP90 = hrvList[(hrvList.length * 0.90).toInt()];
    int stepsP25 = stepsList[(stepsList.length * 0.25).toInt()];
    int stepsP50 = stepsList[(stepsList.length * 0.50).toInt()];
    int stepsP75 = stepsList[(stepsList.length * 0.75).toInt()];
    double sleepP50 = sleepList[(sleepList.length * 0.50).toInt()] / 60;
    double sleepAverage = paData.isNotEmpty ? totalSleep / sleepCount / 60 : 0;
    int stepsAverage = paData.isNotEmpty ? totalSteps ~/ paData.length : 0;
    double spo2Average = paData.isNotEmpty ? totalSpo2 / spo2Count * 100.0 : 0;
    double restingHRAverage =
        paData.isNotEmpty ? totalRestingHR / restingHRCount * 1.0 : 0;
    double vo2MaxAverage =
        paData.isNotEmpty ? totalVo2Max / vo2MaxCount * 1.0 : 0;
    double hrvAverage = paData.isNotEmpty ? totalHrv / hrvCount * 1.0 : 0;

    instructions = """
      My characteristics:
      - gender: ${currentUserDocument?.gender?.name ?? 'unknown'}
      - age: ${currentUserDocument?.age ?? 'unknown'}
      ---
      My activity summary from my activity tracker:
      - total days observed: ${paData.length}
      - average heart rate variability (SDNN): ${hrvAverage == 0 ? 'unknown' : hrvAverage}
      - 10th percentile heart rate variability (SDNN): ${hrvP10 == 0 ? 'unknown' : hrvP10}
      - 50th percentile heart rate variability (SDNN): ${hrvP50 == 0 ? 'unknown' : hrvP50}
      - 90th percentile heart rate variability (SDNN): ${hrvP90 == 0 ? 'unknown' : hrvP90}
      - average sleep length per day: ${sleepAverage == 0 ? 'unknown' : sleepAverage} hours
      - median sleep length per day: ${sleepP50 == 0 ? 'unknown' : sleepP50} hours
      - average steps per day: ${stepsAverage == 0 ? 'unknown' : stepsAverage}
      - 25th percentile steps per day: ${stepsP25 == 0 ? 'unknown' : stepsP25}
      - 50th percentile steps per day: ${stepsP50 == 0 ? 'unknown' : stepsP50}
      - 75th percentile steps per day: ${stepsP75 == 0 ? 'unknown' : stepsP75}
      - average blood oxidation level: ${spo2Average == 0 ? 'unknown' : spo2Average}%
      - average resting heart rate: ${restingHRAverage == 0 ? 'unknown' : restingHRAverage}
      - average VO2 max: ${vo2MaxAverage == 0 ? 'unknown' : vo2MaxAverage}
      ---
      You must provide a comprehensive summary of my overall health based on the provided information, including my age and gender.
      The information must be easily understandable and provide succint recommendations for next steps.
      Go straight to the point and use maximum 200 words.
      """;
  }

  intentPrompt.add({
    "role": "system",
    "content":
        'You are a wellbeing coach. Following is a summary of the user\'s characteristics and activity. Take the information into consideration and provide a response their request.'
  });

  intentPrompt.add({"role": "user", "content": instructions});

  print('\n INTENT PROMPT \n');
  print(intentPrompt);
  return intentPrompt;
}
