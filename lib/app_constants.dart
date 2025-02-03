
abstract class FFAppConstants {
  static const List<String> dataTypesToDownload = [
    'Steps',
    'Workouts',
    'VO2 Max',
    'Sleep',
    'Heart rate',
    'Energy burned',
    'Body composition',
    'Pulse oximetry',
    'Breathing rate',
    'HRV',
    'Blood pressure',
    'Blood glucose',
    'Mobility',
    'Nutrition',
    'Exposure',
    'Vital signs',
    'Medication'
  ];
  static const List<String> safeDataTypesToDownload = [
    'Steps',
    'VO2 Max',
    'Sleep',
    'Energy burned',
    'Heart rate',
    'Workouts',
    'Pulse oximetry',
    'HRV'
  ];
  static const int appVersion = 4;
  static const List<String> defaultSuggestions = [
    'How can I improve my health?',
    'How long will I live?',
    'Give me a healthy recipe based on my food preferences.'
  ];
}
