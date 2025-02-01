import 'package:collection/collection.dart';

enum CoachCategory {
  mental_wellbeing,
  smoking,
  sleep,
  fitness,
  weight_loss,
  nutrition,
  fitness_enhanced,
  goal_coach,
}

enum User {
  coach,
  user,
  system,
  suggestion,
  infographic,
  graph,
}

enum ProcessStep {
  step_01_intro,
  step_02_suggestions,
  step_03_link_tracker,
  step_04_refresh_data,
  step_05_gender,
  step_05b_gender_selection,
  step_06_age,
  step_06_age_selection,
  step_07_done,
}

enum Gender {
  male,
  female,
  other,
}

enum Weekday {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

enum MealType {
  Breakfast,
  Lunch,
  Dinner,
  Snack,
}

enum Level {
  Very_low,
  Low,
  Moderate,
  High,
  Very_high,
}

enum Nba {
  sleep_regularity_start,
  pa_steps_days,
  nutrition_picture_lunch,
  hr_min_days,
  stand_hours_days,
  nutrition_picture_ingredient,
  face_scan,
  mental_wellbeing_assessment,
  healthy_futures,
  medication_adherence,
}

enum Progress {
  account_created,
  tracker_linked,
  onboarding_assessment_complete,
  onboarding_complete,
  hf_demographics,
  hf_pa,
  hf_biometrics,
  hf_nutrition,
  hf_sleep,
  hf_alcohol,
  hf_conditions,
  hf_done,
  hf_doing_face_scan,
}

enum Units {
  kg,
  lb,
  cm,
  inch,
}

enum Smoking {
  current,
  past,
  never,
}

enum Conditions {
  Diabetes,
  Hypertension,
  CardiovascularDisease,
  HighCholesterol,
}

enum MentalWellbeingQuestionnaire {
  not_at_all,
  several_days,
  more_than_half,
  nearly_every_day,
}

enum DietFrequency {
  Never,
  Sometimes,
  Often,
  Always,
}

enum Mood {
  Awful,
  Bad,
  Okay,
  Good,
  Great,
  Unknown,
}

enum PathwayType {
  Assessment,
  NBA,
  Habit,
  Know,
  Activity,
}

enum ActionType {
  activity,
  healthy_action,
  assessment,
  know_action,
  habit_action,
  medical_adherence,
}

enum NotificationFraming {
  loss_aversion,
  social_proofing,
  hyperbolic_discounting,
  anchoring,
}

enum NotificationTime {
  weekday_morning,
  weekday_day,
  weekday_evening,
  weekend_morning,
  weekend_day,
  weekend_evening,
}

enum NotificationType {
  goal_new,
  goal_achieved,
  activity_reminder,
  reward_available,
  vitality_notification,
  plan_notification,
}

enum NotificationResponse {
  engaged,
  opened_app,
  no_action,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (CoachCategory):
      return CoachCategory.values.deserialize(value) as T?;
    case (User):
      return User.values.deserialize(value) as T?;
    case (ProcessStep):
      return ProcessStep.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (Weekday):
      return Weekday.values.deserialize(value) as T?;
    case (MealType):
      return MealType.values.deserialize(value) as T?;
    case (Level):
      return Level.values.deserialize(value) as T?;
    case (Nba):
      return Nba.values.deserialize(value) as T?;
    case (Progress):
      return Progress.values.deserialize(value) as T?;
    case (Units):
      return Units.values.deserialize(value) as T?;
    case (Smoking):
      return Smoking.values.deserialize(value) as T?;
    case (Conditions):
      return Conditions.values.deserialize(value) as T?;
    case (MentalWellbeingQuestionnaire):
      return MentalWellbeingQuestionnaire.values.deserialize(value) as T?;
    case (DietFrequency):
      return DietFrequency.values.deserialize(value) as T?;
    case (Mood):
      return Mood.values.deserialize(value) as T?;
    case (PathwayType):
      return PathwayType.values.deserialize(value) as T?;
    case (ActionType):
      return ActionType.values.deserialize(value) as T?;
    case (NotificationFraming):
      return NotificationFraming.values.deserialize(value) as T?;
    case (NotificationTime):
      return NotificationTime.values.deserialize(value) as T?;
    case (NotificationType):
      return NotificationType.values.deserialize(value) as T?;
    case (NotificationResponse):
      return NotificationResponse.values.deserialize(value) as T?;
    default:
      return null;
  }
}
