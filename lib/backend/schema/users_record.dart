import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "os" field.
  String? _os;
  String get os => _os ?? '';
  bool hasOs() => _os != null;

  // "tracker_linked" field.
  bool? _trackerLinked;
  bool get trackerLinked => _trackerLinked ?? false;
  bool hasTrackerLinked() => _trackerLinked != null;

  // "apple_health_linked" field.
  bool? _appleHealthLinked;
  bool get appleHealthLinked => _appleHealthLinked ?? false;
  bool hasAppleHealthLinked() => _appleHealthLinked != null;

  // "last_data_fetch" field.
  DateTime? _lastDataFetch;
  DateTime? get lastDataFetch => _lastDataFetch;
  bool hasLastDataFetch() => _lastDataFetch != null;

  // "timezone_offset" field.
  int? _timezoneOffset;
  int get timezoneOffset => _timezoneOffset ?? 0;
  bool hasTimezoneOffset() => _timezoneOffset != null;

  // "data_types_to_download" field.
  List<String>? _dataTypesToDownload;
  List<String> get dataTypesToDownload => _dataTypesToDownload ?? const [];
  bool hasDataTypesToDownload() => _dataTypesToDownload != null;

  // "gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "age" field.
  double? _age;
  double get age => _age ?? 0.0;
  bool hasAge() => _age != null;

  // "today_data_exists" field.
  bool? _todayDataExists;
  bool get todayDataExists => _todayDataExists ?? false;
  bool hasTodayDataExists() => _todayDataExists != null;

  // "active_gameboard" field.
  DocumentReference? _activeGameboard;
  DocumentReference? get activeGameboard => _activeGameboard;
  bool hasActiveGameboard() => _activeGameboard != null;

  // "php_onboarded" field.
  bool? _phpOnboarded;
  bool get phpOnboarded => _phpOnboarded ?? false;
  bool hasPhpOnboarded() => _phpOnboarded != null;

  // "nba_active" field.
  List<DocumentReference>? _nbaActive;
  List<DocumentReference> get nbaActive => _nbaActive ?? const [];
  bool hasNbaActive() => _nbaActive != null;

  // "nba_sleep_check" field.
  bool? _nbaSleepCheck;
  bool get nbaSleepCheck => _nbaSleepCheck ?? false;
  bool hasNbaSleepCheck() => _nbaSleepCheck != null;

  // "ring_activity_progress" field.
  double? _ringActivityProgress;
  double get ringActivityProgress => _ringActivityProgress ?? 0.0;
  bool hasRingActivityProgress() => _ringActivityProgress != null;

  // "ring_healthy_action_progress" field.
  double? _ringHealthyActionProgress;
  double get ringHealthyActionProgress => _ringHealthyActionProgress ?? 0.0;
  bool hasRingHealthyActionProgress() => _ringHealthyActionProgress != null;

  // "onboarding_complete" field.
  bool? _onboardingComplete;
  bool get onboardingComplete => _onboardingComplete ?? false;
  bool hasOnboardingComplete() => _onboardingComplete != null;

  // "progress" field.
  Progress? _progress;
  Progress? get progress => _progress;
  bool hasProgress() => _progress != null;

  // "food_extra_goal" field.
  String? _foodExtraGoal;
  String get foodExtraGoal => _foodExtraGoal ?? '';
  bool hasFoodExtraGoal() => _foodExtraGoal != null;

  // "nba_available" field.
  List<DocumentReference>? _nbaAvailable;
  List<DocumentReference> get nbaAvailable => _nbaAvailable ?? const [];
  bool hasNbaAvailable() => _nbaAvailable != null;

  // "food_extra_goal_update" field.
  bool? _foodExtraGoalUpdate;
  bool get foodExtraGoalUpdate => _foodExtraGoalUpdate ?? false;
  bool hasFoodExtraGoalUpdate() => _foodExtraGoalUpdate != null;

  // "homepage_message_updated" field.
  bool? _homepageMessageUpdated;
  bool get homepageMessageUpdated => _homepageMessageUpdated ?? false;
  bool hasHomepageMessageUpdated() => _homepageMessageUpdated != null;

  // "bmi" field.
  double? _bmi;
  double get bmi => _bmi ?? 0.0;
  bool hasBmi() => _bmi != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "height_unit" field.
  Units? _heightUnit;
  Units? get heightUnit => _heightUnit;
  bool hasHeightUnit() => _heightUnit != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "weight_unit" field.
  Units? _weightUnit;
  Units? get weightUnit => _weightUnit;
  bool hasWeightUnit() => _weightUnit != null;

  // "waist" field.
  double? _waist;
  double get waist => _waist ?? 0.0;
  bool hasWaist() => _waist != null;

  // "waist_unit" field.
  Units? _waistUnit;
  Units? get waistUnit => _waistUnit;
  bool hasWaistUnit() => _waistUnit != null;

  // "smoking" field.
  Smoking? _smoking;
  Smoking? get smoking => _smoking;
  bool hasSmoking() => _smoking != null;

  // "smoking_other" field.
  bool? _smokingOther;
  bool get smokingOther => _smokingOther ?? false;
  bool hasSmokingOther() => _smokingOther != null;

  // "smoking_years" field.
  int? _smokingYears;
  int get smokingYears => _smokingYears ?? 0;
  bool hasSmokingYears() => _smokingYears != null;

  // "smoking_units" field.
  int? _smokingUnits;
  int get smokingUnits => _smokingUnits ?? 0;
  bool hasSmokingUnits() => _smokingUnits != null;

  // "moderate_activity_days" field.
  int? _moderateActivityDays;
  int get moderateActivityDays => _moderateActivityDays ?? 0;
  bool hasModerateActivityDays() => _moderateActivityDays != null;

  // "vigorous_activity_days" field.
  int? _vigorousActivityDays;
  int get vigorousActivityDays => _vigorousActivityDays ?? 0;
  bool hasVigorousActivityDays() => _vigorousActivityDays != null;

  // "mh_anxious" field.
  MentalWellbeingQuestionnaire? _mhAnxious;
  MentalWellbeingQuestionnaire? get mhAnxious => _mhAnxious;
  bool hasMhAnxious() => _mhAnxious != null;

  // "mh_worrying" field.
  MentalWellbeingQuestionnaire? _mhWorrying;
  MentalWellbeingQuestionnaire? get mhWorrying => _mhWorrying;
  bool hasMhWorrying() => _mhWorrying != null;

  // "mh_interest" field.
  MentalWellbeingQuestionnaire? _mhInterest;
  MentalWellbeingQuestionnaire? get mhInterest => _mhInterest;
  bool hasMhInterest() => _mhInterest != null;

  // "mh_depressed" field.
  MentalWellbeingQuestionnaire? _mhDepressed;
  MentalWellbeingQuestionnaire? get mhDepressed => _mhDepressed;
  bool hasMhDepressed() => _mhDepressed != null;

  // "mh_mood" field.
  int? _mhMood;
  int get mhMood => _mhMood ?? 0;
  bool hasMhMood() => _mhMood != null;

  // "conditions" field.
  List<String>? _conditions;
  List<String> get conditions => _conditions ?? const [];
  bool hasConditions() => _conditions != null;

  // "app_version" field.
  int? _appVersion;
  int get appVersion => _appVersion ?? 0;
  bool hasAppVersion() => _appVersion != null;

  // "hf_ref" field.
  DocumentReference? _hfRef;
  DocumentReference? get hfRef => _hfRef;
  bool hasHfRef() => _hfRef != null;

  // "bp_sys" field.
  int? _bpSys;
  int get bpSys => _bpSys ?? 0;
  bool hasBpSys() => _bpSys != null;

  // "bp_dia" field.
  int? _bpDia;
  int get bpDia => _bpDia ?? 0;
  bool hasBpDia() => _bpDia != null;

  // "rhr" field.
  int? _rhr;
  int get rhr => _rhr ?? 0;
  bool hasRhr() => _rhr != null;

  // "hrv" field.
  double? _hrv;
  double get hrv => _hrv ?? 0.0;
  bool hasHrv() => _hrv != null;

  // "hrv_unit" field.
  String? _hrvUnit;
  String get hrvUnit => _hrvUnit ?? '';
  bool hasHrvUnit() => _hrvUnit != null;

  // "last_mood_asked" field.
  DateTime? _lastMoodAsked;
  DateTime? get lastMoodAsked => _lastMoodAsked;
  bool hasLastMoodAsked() => _lastMoodAsked != null;

  // "last_mood_submitted" field.
  DateTime? _lastMoodSubmitted;
  DateTime? get lastMoodSubmitted => _lastMoodSubmitted;
  bool hasLastMoodSubmitted() => _lastMoodSubmitted != null;

  // "health_feedback_available" field.
  bool? _healthFeedbackAvailable;
  bool get healthFeedbackAvailable => _healthFeedbackAvailable ?? false;
  bool hasHealthFeedbackAvailable() => _healthFeedbackAvailable != null;

  // "walkthrough_homepage_done" field.
  bool? _walkthroughHomepageDone;
  bool get walkthroughHomepageDone => _walkthroughHomepageDone ?? false;
  bool hasWalkthroughHomepageDone() => _walkthroughHomepageDone != null;

  // "rewards_available" field.
  int? _rewardsAvailable;
  int get rewardsAvailable => _rewardsAvailable ?? 0;
  bool hasRewardsAvailable() => _rewardsAvailable != null;

  // "speech_link" field.
  String? _speechLink;
  String get speechLink => _speechLink ?? '';
  bool hasSpeechLink() => _speechLink != null;

  // "vitality_objectives" field.
  List<String>? _vitalityObjectives;
  List<String> get vitalityObjectives => _vitalityObjectives ?? const [];
  bool hasVitalityObjectives() => _vitalityObjectives != null;

  // "pathway_selected" field.
  bool? _pathwaySelected;
  bool get pathwaySelected => _pathwaySelected ?? false;
  bool hasPathwaySelected() => _pathwaySelected != null;

  // "pathway_walkthrough_complete" field.
  bool? _pathwayWalkthroughComplete;
  bool get pathwayWalkthroughComplete => _pathwayWalkthroughComplete ?? false;
  bool hasPathwayWalkthroughComplete() => _pathwayWalkthroughComplete != null;

  // "notifications_personality" field.
  List<String>? _notificationsPersonality;
  List<String> get notificationsPersonality =>
      _notificationsPersonality ?? const [];
  bool hasNotificationsPersonality() => _notificationsPersonality != null;

  // "notifications_summary" field.
  String? _notificationsSummary;
  String get notificationsSummary => _notificationsSummary ?? '';
  bool hasNotificationsSummary() => _notificationsSummary != null;

  // "notifications_formality" field.
  String? _notificationsFormality;
  String get notificationsFormality => _notificationsFormality ?? '';
  bool hasNotificationsFormality() => _notificationsFormality != null;

  // "notifications_frequency" field.
  String? _notificationsFrequency;
  String get notificationsFrequency => _notificationsFrequency ?? '';
  bool hasNotificationsFrequency() => _notificationsFrequency != null;

  // "notifications_motivation" field.
  String? _notificationsMotivation;
  String get notificationsMotivation => _notificationsMotivation ?? '';
  bool hasNotificationsMotivation() => _notificationsMotivation != null;

  // "notifications_time_discounting" field.
  String? _notificationsTimeDiscounting;
  String get notificationsTimeDiscounting =>
      _notificationsTimeDiscounting ?? '';
  bool hasNotificationsTimeDiscounting() =>
      _notificationsTimeDiscounting != null;

  // "communication_type_loss_aversion" field.
  double? _communicationTypeLossAversion;
  double get communicationTypeLossAversion =>
      _communicationTypeLossAversion ?? 0.0;
  bool hasCommunicationTypeLossAversion() =>
      _communicationTypeLossAversion != null;

  // "communication_type_social_proofing" field.
  double? _communicationTypeSocialProofing;
  double get communicationTypeSocialProofing =>
      _communicationTypeSocialProofing ?? 0.0;
  bool hasCommunicationTypeSocialProofing() =>
      _communicationTypeSocialProofing != null;

  // "communication_type_hyperbolic_discounting" field.
  double? _communicationTypeHyperbolicDiscounting;
  double get communicationTypeHyperbolicDiscounting =>
      _communicationTypeHyperbolicDiscounting ?? 0.0;
  bool hasCommunicationTypeHyperbolicDiscounting() =>
      _communicationTypeHyperbolicDiscounting != null;

  // "communication_type_anchoring" field.
  double? _communicationTypeAnchoring;
  double get communicationTypeAnchoring => _communicationTypeAnchoring ?? 0.0;
  bool hasCommunicationTypeAnchoring() => _communicationTypeAnchoring != null;

  // "communication_current_types" field.
  List<NotificationType>? _communicationCurrentTypes;
  List<NotificationType> get communicationCurrentTypes =>
      _communicationCurrentTypes ?? const [];
  bool hasCommunicationCurrentTypes() => _communicationCurrentTypes != null;

  // "communication_current_times" field.
  List<NotificationTime>? _communicationCurrentTimes;
  List<NotificationTime> get communicationCurrentTimes =>
      _communicationCurrentTimes ?? const [];
  bool hasCommunicationCurrentTimes() => _communicationCurrentTimes != null;

  // "vg_exco_demo_step" field.
  int? _vgExcoDemoStep;
  int get vgExcoDemoStep => _vgExcoDemoStep ?? 0;
  bool hasVgExcoDemoStep() => _vgExcoDemoStep != null;

  // "step_goal_low" field.
  int? _stepGoalLow;
  int get stepGoalLow => _stepGoalLow ?? 0;
  bool hasStepGoalLow() => _stepGoalLow != null;

  // "step_goal_standard" field.
  int? _stepGoalStandard;
  int get stepGoalStandard => _stepGoalStandard ?? 0;
  bool hasStepGoalStandard() => _stepGoalStandard != null;

  // "step_goal_advanced" field.
  int? _stepGoalAdvanced;
  int get stepGoalAdvanced => _stepGoalAdvanced ?? 0;
  bool hasStepGoalAdvanced() => _stepGoalAdvanced != null;

  // "get_active_active" field.
  bool? _getActiveActive;
  bool get getActiveActive => _getActiveActive ?? false;
  bool hasGetActiveActive() => _getActiveActive != null;

  // "vitality_points" field.
  int? _vitalityPoints;
  int get vitalityPoints => _vitalityPoints ?? 0;
  bool hasVitalityPoints() => _vitalityPoints != null;

  // "vitality_status" field.
  int? _vitalityStatus;
  int get vitalityStatus => _vitalityStatus ?? 0;
  bool hasVitalityStatus() => _vitalityStatus != null;

  // "php_vital_signs" field.
  bool? _phpVitalSigns;
  bool get phpVitalSigns => _phpVitalSigns ?? false;
  bool hasPhpVitalSigns() => _phpVitalSigns != null;

  // "php_mobility_assessment" field.
  bool? _phpMobilityAssessment;
  bool get phpMobilityAssessment => _phpMobilityAssessment ?? false;
  bool hasPhpMobilityAssessment() => _phpMobilityAssessment != null;

  // "php_visit_doctor" field.
  bool? _phpVisitDoctor;
  bool get phpVisitDoctor => _phpVisitDoctor ?? false;
  bool hasPhpVisitDoctor() => _phpVisitDoctor != null;

  // "php_digital_health_profile" field.
  bool? _phpDigitalHealthProfile;
  bool get phpDigitalHealthProfile => _phpDigitalHealthProfile ?? false;
  bool hasPhpDigitalHealthProfile() => _phpDigitalHealthProfile != null;

  // "php_vital_signs_done" field.
  bool? _phpVitalSignsDone;
  bool get phpVitalSignsDone => _phpVitalSignsDone ?? false;
  bool hasPhpVitalSignsDone() => _phpVitalSignsDone != null;

  // "php_mobility_assessment_done" field.
  bool? _phpMobilityAssessmentDone;
  bool get phpMobilityAssessmentDone => _phpMobilityAssessmentDone ?? false;
  bool hasPhpMobilityAssessmentDone() => _phpMobilityAssessmentDone != null;

  // "php_bodyscan" field.
  bool? _phpBodyscan;
  bool get phpBodyscan => _phpBodyscan ?? false;
  bool hasPhpBodyscan() => _phpBodyscan != null;

  // "php_bodyscan_done" field.
  bool? _phpBodyscanDone;
  bool get phpBodyscanDone => _phpBodyscanDone ?? false;
  bool hasPhpBodyscanDone() => _phpBodyscanDone != null;

  // "php_health_review" field.
  bool? _phpHealthReview;
  bool get phpHealthReview => _phpHealthReview ?? false;
  bool hasPhpHealthReview() => _phpHealthReview != null;

  // "php_health_review_done" field.
  bool? _phpHealthReviewDone;
  bool get phpHealthReviewDone => _phpHealthReviewDone ?? false;
  bool hasPhpHealthReviewDone() => _phpHealthReviewDone != null;

  // "step_goal_very_low" field.
  int? _stepGoalVeryLow;
  int get stepGoalVeryLow => _stepGoalVeryLow ?? 0;
  bool hasStepGoalVeryLow() => _stepGoalVeryLow != null;

  // "hi_threshold" field.
  int? _hiThreshold;
  int get hiThreshold => _hiThreshold ?? 0;
  bool hasHiThreshold() => _hiThreshold != null;

  // "hi_days" field.
  int? _hiDays;
  int get hiDays => _hiDays ?? 0;
  bool hasHiDays() => _hiDays != null;

  // "hi_freq_value" field.
  int? _hiFreqValue;
  int get hiFreqValue => _hiFreqValue ?? 0;
  bool hasHiFreqValue() => _hiFreqValue != null;

  // "hi_error" field.
  String? _hiError;
  String get hiError => _hiError ?? '';
  bool hasHiError() => _hiError != null;

  // "hi_consistency" field.
  double? _hiConsistency;
  double get hiConsistency => _hiConsistency ?? 0.0;
  bool hasHiConsistency() => _hiConsistency != null;

  // "hi_exposure" field.
  int? _hiExposure;
  int get hiExposure => _hiExposure ?? 0;
  bool hasHiExposure() => _hiExposure != null;

  // "hi_days_tracked" field.
  int? _hiDaysTracked;
  int get hiDaysTracked => _hiDaysTracked ?? 0;
  bool hasHiDaysTracked() => _hiDaysTracked != null;

  // "hi_intro" field.
  bool? _hiIntro;
  bool get hiIntro => _hiIntro ?? false;
  bool hasHiIntro() => _hiIntro != null;

  // "hi_intro_choice" field.
  bool? _hiIntroChoice;
  bool get hiIntroChoice => _hiIntroChoice ?? false;
  bool hasHiIntroChoice() => _hiIntroChoice != null;

  // "php_journey_intro" field.
  bool? _phpJourneyIntro;
  bool get phpJourneyIntro => _phpJourneyIntro ?? false;
  bool hasPhpJourneyIntro() => _phpJourneyIntro != null;

  // "journey_active" field.
  bool? _journeyActive;
  bool get journeyActive => _journeyActive ?? false;
  bool hasJourneyActive() => _journeyActive != null;

  // "priority_action_active" field.
  bool? _priorityActionActive;
  bool get priorityActionActive => _priorityActionActive ?? false;
  bool hasPriorityActionActive() => _priorityActionActive != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _os = snapshotData['os'] as String?;
    _trackerLinked = snapshotData['tracker_linked'] as bool?;
    _appleHealthLinked = snapshotData['apple_health_linked'] as bool?;
    _lastDataFetch = snapshotData['last_data_fetch'] as DateTime?;
    _timezoneOffset = castToType<int>(snapshotData['timezone_offset']);
    _dataTypesToDownload = getDataList(snapshotData['data_types_to_download']);
    _gender = snapshotData['gender'] is Gender
        ? snapshotData['gender']
        : deserializeEnum<Gender>(snapshotData['gender']);
    _age = castToType<double>(snapshotData['age']);
    _todayDataExists = snapshotData['today_data_exists'] as bool?;
    _activeGameboard = snapshotData['active_gameboard'] as DocumentReference?;
    _phpOnboarded = snapshotData['php_onboarded'] as bool?;
    _nbaActive = getDataList(snapshotData['nba_active']);
    _nbaSleepCheck = snapshotData['nba_sleep_check'] as bool?;
    _ringActivityProgress =
        castToType<double>(snapshotData['ring_activity_progress']);
    _ringHealthyActionProgress =
        castToType<double>(snapshotData['ring_healthy_action_progress']);
    _onboardingComplete = snapshotData['onboarding_complete'] as bool?;
    _progress = snapshotData['progress'] is Progress
        ? snapshotData['progress']
        : deserializeEnum<Progress>(snapshotData['progress']);
    _foodExtraGoal = snapshotData['food_extra_goal'] as String?;
    _nbaAvailable = getDataList(snapshotData['nba_available']);
    _foodExtraGoalUpdate = snapshotData['food_extra_goal_update'] as bool?;
    _homepageMessageUpdated = snapshotData['homepage_message_updated'] as bool?;
    _bmi = castToType<double>(snapshotData['bmi']);
    _height = castToType<double>(snapshotData['height']);
    _heightUnit = snapshotData['height_unit'] is Units
        ? snapshotData['height_unit']
        : deserializeEnum<Units>(snapshotData['height_unit']);
    _weight = castToType<double>(snapshotData['weight']);
    _weightUnit = snapshotData['weight_unit'] is Units
        ? snapshotData['weight_unit']
        : deserializeEnum<Units>(snapshotData['weight_unit']);
    _waist = castToType<double>(snapshotData['waist']);
    _waistUnit = snapshotData['waist_unit'] is Units
        ? snapshotData['waist_unit']
        : deserializeEnum<Units>(snapshotData['waist_unit']);
    _smoking = snapshotData['smoking'] is Smoking
        ? snapshotData['smoking']
        : deserializeEnum<Smoking>(snapshotData['smoking']);
    _smokingOther = snapshotData['smoking_other'] as bool?;
    _smokingYears = castToType<int>(snapshotData['smoking_years']);
    _smokingUnits = castToType<int>(snapshotData['smoking_units']);
    _moderateActivityDays =
        castToType<int>(snapshotData['moderate_activity_days']);
    _vigorousActivityDays =
        castToType<int>(snapshotData['vigorous_activity_days']);
    _mhAnxious = snapshotData['mh_anxious'] is MentalWellbeingQuestionnaire
        ? snapshotData['mh_anxious']
        : deserializeEnum<MentalWellbeingQuestionnaire>(
            snapshotData['mh_anxious']);
    _mhWorrying = snapshotData['mh_worrying'] is MentalWellbeingQuestionnaire
        ? snapshotData['mh_worrying']
        : deserializeEnum<MentalWellbeingQuestionnaire>(
            snapshotData['mh_worrying']);
    _mhInterest = snapshotData['mh_interest'] is MentalWellbeingQuestionnaire
        ? snapshotData['mh_interest']
        : deserializeEnum<MentalWellbeingQuestionnaire>(
            snapshotData['mh_interest']);
    _mhDepressed = snapshotData['mh_depressed'] is MentalWellbeingQuestionnaire
        ? snapshotData['mh_depressed']
        : deserializeEnum<MentalWellbeingQuestionnaire>(
            snapshotData['mh_depressed']);
    _mhMood = castToType<int>(snapshotData['mh_mood']);
    _conditions = getDataList(snapshotData['conditions']);
    _appVersion = castToType<int>(snapshotData['app_version']);
    _hfRef = snapshotData['hf_ref'] as DocumentReference?;
    _bpSys = castToType<int>(snapshotData['bp_sys']);
    _bpDia = castToType<int>(snapshotData['bp_dia']);
    _rhr = castToType<int>(snapshotData['rhr']);
    _hrv = castToType<double>(snapshotData['hrv']);
    _hrvUnit = snapshotData['hrv_unit'] as String?;
    _lastMoodAsked = snapshotData['last_mood_asked'] as DateTime?;
    _lastMoodSubmitted = snapshotData['last_mood_submitted'] as DateTime?;
    _healthFeedbackAvailable =
        snapshotData['health_feedback_available'] as bool?;
    _walkthroughHomepageDone =
        snapshotData['walkthrough_homepage_done'] as bool?;
    _rewardsAvailable = castToType<int>(snapshotData['rewards_available']);
    _speechLink = snapshotData['speech_link'] as String?;
    _vitalityObjectives = getDataList(snapshotData['vitality_objectives']);
    _pathwaySelected = snapshotData['pathway_selected'] as bool?;
    _pathwayWalkthroughComplete =
        snapshotData['pathway_walkthrough_complete'] as bool?;
    _notificationsPersonality =
        getDataList(snapshotData['notifications_personality']);
    _notificationsSummary = snapshotData['notifications_summary'] as String?;
    _notificationsFormality =
        snapshotData['notifications_formality'] as String?;
    _notificationsFrequency =
        snapshotData['notifications_frequency'] as String?;
    _notificationsMotivation =
        snapshotData['notifications_motivation'] as String?;
    _notificationsTimeDiscounting =
        snapshotData['notifications_time_discounting'] as String?;
    _communicationTypeLossAversion =
        castToType<double>(snapshotData['communication_type_loss_aversion']);
    _communicationTypeSocialProofing =
        castToType<double>(snapshotData['communication_type_social_proofing']);
    _communicationTypeHyperbolicDiscounting = castToType<double>(
        snapshotData['communication_type_hyperbolic_discounting']);
    _communicationTypeAnchoring =
        castToType<double>(snapshotData['communication_type_anchoring']);
    _communicationCurrentTypes = getEnumList<NotificationType>(
        snapshotData['communication_current_types']);
    _communicationCurrentTimes = getEnumList<NotificationTime>(
        snapshotData['communication_current_times']);
    _vgExcoDemoStep = castToType<int>(snapshotData['vg_exco_demo_step']);
    _stepGoalLow = castToType<int>(snapshotData['step_goal_low']);
    _stepGoalStandard = castToType<int>(snapshotData['step_goal_standard']);
    _stepGoalAdvanced = castToType<int>(snapshotData['step_goal_advanced']);
    _getActiveActive = snapshotData['get_active_active'] as bool?;
    _vitalityPoints = castToType<int>(snapshotData['vitality_points']);
    _vitalityStatus = castToType<int>(snapshotData['vitality_status']);
    _phpVitalSigns = snapshotData['php_vital_signs'] as bool?;
    _phpMobilityAssessment = snapshotData['php_mobility_assessment'] as bool?;
    _phpVisitDoctor = snapshotData['php_visit_doctor'] as bool?;
    _phpDigitalHealthProfile =
        snapshotData['php_digital_health_profile'] as bool?;
    _phpVitalSignsDone = snapshotData['php_vital_signs_done'] as bool?;
    _phpMobilityAssessmentDone =
        snapshotData['php_mobility_assessment_done'] as bool?;
    _phpBodyscan = snapshotData['php_bodyscan'] as bool?;
    _phpBodyscanDone = snapshotData['php_bodyscan_done'] as bool?;
    _phpHealthReview = snapshotData['php_health_review'] as bool?;
    _phpHealthReviewDone = snapshotData['php_health_review_done'] as bool?;
    _stepGoalVeryLow = castToType<int>(snapshotData['step_goal_very_low']);
    _hiThreshold = castToType<int>(snapshotData['hi_threshold']);
    _hiDays = castToType<int>(snapshotData['hi_days']);
    _hiFreqValue = castToType<int>(snapshotData['hi_freq_value']);
    _hiError = snapshotData['hi_error'] as String?;
    _hiConsistency = castToType<double>(snapshotData['hi_consistency']);
    _hiExposure = castToType<int>(snapshotData['hi_exposure']);
    _hiDaysTracked = castToType<int>(snapshotData['hi_days_tracked']);
    _hiIntro = snapshotData['hi_intro'] as bool?;
    _hiIntroChoice = snapshotData['hi_intro_choice'] as bool?;
    _phpJourneyIntro = snapshotData['php_journey_intro'] as bool?;
    _journeyActive = snapshotData['journey_active'] as bool?;
    _priorityActionActive = snapshotData['priority_action_active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? os,
  bool? trackerLinked,
  bool? appleHealthLinked,
  DateTime? lastDataFetch,
  int? timezoneOffset,
  Gender? gender,
  double? age,
  bool? todayDataExists,
  DocumentReference? activeGameboard,
  bool? phpOnboarded,
  bool? nbaSleepCheck,
  double? ringActivityProgress,
  double? ringHealthyActionProgress,
  bool? onboardingComplete,
  Progress? progress,
  String? foodExtraGoal,
  bool? foodExtraGoalUpdate,
  bool? homepageMessageUpdated,
  double? bmi,
  double? height,
  Units? heightUnit,
  double? weight,
  Units? weightUnit,
  double? waist,
  Units? waistUnit,
  Smoking? smoking,
  bool? smokingOther,
  int? smokingYears,
  int? smokingUnits,
  int? moderateActivityDays,
  int? vigorousActivityDays,
  MentalWellbeingQuestionnaire? mhAnxious,
  MentalWellbeingQuestionnaire? mhWorrying,
  MentalWellbeingQuestionnaire? mhInterest,
  MentalWellbeingQuestionnaire? mhDepressed,
  int? mhMood,
  int? appVersion,
  DocumentReference? hfRef,
  int? bpSys,
  int? bpDia,
  int? rhr,
  double? hrv,
  String? hrvUnit,
  DateTime? lastMoodAsked,
  DateTime? lastMoodSubmitted,
  bool? healthFeedbackAvailable,
  bool? walkthroughHomepageDone,
  int? rewardsAvailable,
  String? speechLink,
  bool? pathwaySelected,
  bool? pathwayWalkthroughComplete,
  String? notificationsSummary,
  String? notificationsFormality,
  String? notificationsFrequency,
  String? notificationsMotivation,
  String? notificationsTimeDiscounting,
  double? communicationTypeLossAversion,
  double? communicationTypeSocialProofing,
  double? communicationTypeHyperbolicDiscounting,
  double? communicationTypeAnchoring,
  int? vgExcoDemoStep,
  int? stepGoalLow,
  int? stepGoalStandard,
  int? stepGoalAdvanced,
  bool? getActiveActive,
  int? vitalityPoints,
  int? vitalityStatus,
  bool? phpVitalSigns,
  bool? phpMobilityAssessment,
  bool? phpVisitDoctor,
  bool? phpDigitalHealthProfile,
  bool? phpVitalSignsDone,
  bool? phpMobilityAssessmentDone,
  bool? phpBodyscan,
  bool? phpBodyscanDone,
  bool? phpHealthReview,
  bool? phpHealthReviewDone,
  int? stepGoalVeryLow,
  int? hiThreshold,
  int? hiDays,
  int? hiFreqValue,
  String? hiError,
  double? hiConsistency,
  int? hiExposure,
  int? hiDaysTracked,
  bool? hiIntro,
  bool? hiIntroChoice,
  bool? phpJourneyIntro,
  bool? journeyActive,
  bool? priorityActionActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'os': os,
      'tracker_linked': trackerLinked,
      'apple_health_linked': appleHealthLinked,
      'last_data_fetch': lastDataFetch,
      'timezone_offset': timezoneOffset,
      'gender': gender,
      'age': age,
      'today_data_exists': todayDataExists,
      'active_gameboard': activeGameboard,
      'php_onboarded': phpOnboarded,
      'nba_sleep_check': nbaSleepCheck,
      'ring_activity_progress': ringActivityProgress,
      'ring_healthy_action_progress': ringHealthyActionProgress,
      'onboarding_complete': onboardingComplete,
      'progress': progress,
      'food_extra_goal': foodExtraGoal,
      'food_extra_goal_update': foodExtraGoalUpdate,
      'homepage_message_updated': homepageMessageUpdated,
      'bmi': bmi,
      'height': height,
      'height_unit': heightUnit,
      'weight': weight,
      'weight_unit': weightUnit,
      'waist': waist,
      'waist_unit': waistUnit,
      'smoking': smoking,
      'smoking_other': smokingOther,
      'smoking_years': smokingYears,
      'smoking_units': smokingUnits,
      'moderate_activity_days': moderateActivityDays,
      'vigorous_activity_days': vigorousActivityDays,
      'mh_anxious': mhAnxious,
      'mh_worrying': mhWorrying,
      'mh_interest': mhInterest,
      'mh_depressed': mhDepressed,
      'mh_mood': mhMood,
      'app_version': appVersion,
      'hf_ref': hfRef,
      'bp_sys': bpSys,
      'bp_dia': bpDia,
      'rhr': rhr,
      'hrv': hrv,
      'hrv_unit': hrvUnit,
      'last_mood_asked': lastMoodAsked,
      'last_mood_submitted': lastMoodSubmitted,
      'health_feedback_available': healthFeedbackAvailable,
      'walkthrough_homepage_done': walkthroughHomepageDone,
      'rewards_available': rewardsAvailable,
      'speech_link': speechLink,
      'pathway_selected': pathwaySelected,
      'pathway_walkthrough_complete': pathwayWalkthroughComplete,
      'notifications_summary': notificationsSummary,
      'notifications_formality': notificationsFormality,
      'notifications_frequency': notificationsFrequency,
      'notifications_motivation': notificationsMotivation,
      'notifications_time_discounting': notificationsTimeDiscounting,
      'communication_type_loss_aversion': communicationTypeLossAversion,
      'communication_type_social_proofing': communicationTypeSocialProofing,
      'communication_type_hyperbolic_discounting':
          communicationTypeHyperbolicDiscounting,
      'communication_type_anchoring': communicationTypeAnchoring,
      'vg_exco_demo_step': vgExcoDemoStep,
      'step_goal_low': stepGoalLow,
      'step_goal_standard': stepGoalStandard,
      'step_goal_advanced': stepGoalAdvanced,
      'get_active_active': getActiveActive,
      'vitality_points': vitalityPoints,
      'vitality_status': vitalityStatus,
      'php_vital_signs': phpVitalSigns,
      'php_mobility_assessment': phpMobilityAssessment,
      'php_visit_doctor': phpVisitDoctor,
      'php_digital_health_profile': phpDigitalHealthProfile,
      'php_vital_signs_done': phpVitalSignsDone,
      'php_mobility_assessment_done': phpMobilityAssessmentDone,
      'php_bodyscan': phpBodyscan,
      'php_bodyscan_done': phpBodyscanDone,
      'php_health_review': phpHealthReview,
      'php_health_review_done': phpHealthReviewDone,
      'step_goal_very_low': stepGoalVeryLow,
      'hi_threshold': hiThreshold,
      'hi_days': hiDays,
      'hi_freq_value': hiFreqValue,
      'hi_error': hiError,
      'hi_consistency': hiConsistency,
      'hi_exposure': hiExposure,
      'hi_days_tracked': hiDaysTracked,
      'hi_intro': hiIntro,
      'hi_intro_choice': hiIntroChoice,
      'php_journey_intro': phpJourneyIntro,
      'journey_active': journeyActive,
      'priority_action_active': priorityActionActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.os == e2?.os &&
        e1?.trackerLinked == e2?.trackerLinked &&
        e1?.appleHealthLinked == e2?.appleHealthLinked &&
        e1?.lastDataFetch == e2?.lastDataFetch &&
        e1?.timezoneOffset == e2?.timezoneOffset &&
        listEquality.equals(e1?.dataTypesToDownload, e2?.dataTypesToDownload) &&
        e1?.gender == e2?.gender &&
        e1?.age == e2?.age &&
        e1?.todayDataExists == e2?.todayDataExists &&
        e1?.activeGameboard == e2?.activeGameboard &&
        e1?.phpOnboarded == e2?.phpOnboarded &&
        listEquality.equals(e1?.nbaActive, e2?.nbaActive) &&
        e1?.nbaSleepCheck == e2?.nbaSleepCheck &&
        e1?.ringActivityProgress == e2?.ringActivityProgress &&
        e1?.ringHealthyActionProgress == e2?.ringHealthyActionProgress &&
        e1?.onboardingComplete == e2?.onboardingComplete &&
        e1?.progress == e2?.progress &&
        e1?.foodExtraGoal == e2?.foodExtraGoal &&
        listEquality.equals(e1?.nbaAvailable, e2?.nbaAvailable) &&
        e1?.foodExtraGoalUpdate == e2?.foodExtraGoalUpdate &&
        e1?.homepageMessageUpdated == e2?.homepageMessageUpdated &&
        e1?.bmi == e2?.bmi &&
        e1?.height == e2?.height &&
        e1?.heightUnit == e2?.heightUnit &&
        e1?.weight == e2?.weight &&
        e1?.weightUnit == e2?.weightUnit &&
        e1?.waist == e2?.waist &&
        e1?.waistUnit == e2?.waistUnit &&
        e1?.smoking == e2?.smoking &&
        e1?.smokingOther == e2?.smokingOther &&
        e1?.smokingYears == e2?.smokingYears &&
        e1?.smokingUnits == e2?.smokingUnits &&
        e1?.moderateActivityDays == e2?.moderateActivityDays &&
        e1?.vigorousActivityDays == e2?.vigorousActivityDays &&
        e1?.mhAnxious == e2?.mhAnxious &&
        e1?.mhWorrying == e2?.mhWorrying &&
        e1?.mhInterest == e2?.mhInterest &&
        e1?.mhDepressed == e2?.mhDepressed &&
        e1?.mhMood == e2?.mhMood &&
        listEquality.equals(e1?.conditions, e2?.conditions) &&
        e1?.appVersion == e2?.appVersion &&
        e1?.hfRef == e2?.hfRef &&
        e1?.bpSys == e2?.bpSys &&
        e1?.bpDia == e2?.bpDia &&
        e1?.rhr == e2?.rhr &&
        e1?.hrv == e2?.hrv &&
        e1?.hrvUnit == e2?.hrvUnit &&
        e1?.lastMoodAsked == e2?.lastMoodAsked &&
        e1?.lastMoodSubmitted == e2?.lastMoodSubmitted &&
        e1?.healthFeedbackAvailable == e2?.healthFeedbackAvailable &&
        e1?.walkthroughHomepageDone == e2?.walkthroughHomepageDone &&
        e1?.rewardsAvailable == e2?.rewardsAvailable &&
        e1?.speechLink == e2?.speechLink &&
        listEquality.equals(e1?.vitalityObjectives, e2?.vitalityObjectives) &&
        e1?.pathwaySelected == e2?.pathwaySelected &&
        e1?.pathwayWalkthroughComplete == e2?.pathwayWalkthroughComplete &&
        listEquality.equals(
            e1?.notificationsPersonality, e2?.notificationsPersonality) &&
        e1?.notificationsSummary == e2?.notificationsSummary &&
        e1?.notificationsFormality == e2?.notificationsFormality &&
        e1?.notificationsFrequency == e2?.notificationsFrequency &&
        e1?.notificationsMotivation == e2?.notificationsMotivation &&
        e1?.notificationsTimeDiscounting == e2?.notificationsTimeDiscounting &&
        e1?.communicationTypeLossAversion ==
            e2?.communicationTypeLossAversion &&
        e1?.communicationTypeSocialProofing ==
            e2?.communicationTypeSocialProofing &&
        e1?.communicationTypeHyperbolicDiscounting ==
            e2?.communicationTypeHyperbolicDiscounting &&
        e1?.communicationTypeAnchoring == e2?.communicationTypeAnchoring &&
        listEquality.equals(
            e1?.communicationCurrentTypes, e2?.communicationCurrentTypes) &&
        listEquality.equals(
            e1?.communicationCurrentTimes, e2?.communicationCurrentTimes) &&
        e1?.vgExcoDemoStep == e2?.vgExcoDemoStep &&
        e1?.stepGoalLow == e2?.stepGoalLow &&
        e1?.stepGoalStandard == e2?.stepGoalStandard &&
        e1?.stepGoalAdvanced == e2?.stepGoalAdvanced &&
        e1?.getActiveActive == e2?.getActiveActive &&
        e1?.vitalityPoints == e2?.vitalityPoints &&
        e1?.vitalityStatus == e2?.vitalityStatus &&
        e1?.phpVitalSigns == e2?.phpVitalSigns &&
        e1?.phpMobilityAssessment == e2?.phpMobilityAssessment &&
        e1?.phpVisitDoctor == e2?.phpVisitDoctor &&
        e1?.phpDigitalHealthProfile == e2?.phpDigitalHealthProfile &&
        e1?.phpVitalSignsDone == e2?.phpVitalSignsDone &&
        e1?.phpMobilityAssessmentDone == e2?.phpMobilityAssessmentDone &&
        e1?.phpBodyscan == e2?.phpBodyscan &&
        e1?.phpBodyscanDone == e2?.phpBodyscanDone &&
        e1?.phpHealthReview == e2?.phpHealthReview &&
        e1?.phpHealthReviewDone == e2?.phpHealthReviewDone &&
        e1?.stepGoalVeryLow == e2?.stepGoalVeryLow &&
        e1?.hiThreshold == e2?.hiThreshold &&
        e1?.hiDays == e2?.hiDays &&
        e1?.hiFreqValue == e2?.hiFreqValue &&
        e1?.hiError == e2?.hiError &&
        e1?.hiConsistency == e2?.hiConsistency &&
        e1?.hiExposure == e2?.hiExposure &&
        e1?.hiDaysTracked == e2?.hiDaysTracked &&
        e1?.hiIntro == e2?.hiIntro &&
        e1?.hiIntroChoice == e2?.hiIntroChoice &&
        e1?.phpJourneyIntro == e2?.phpJourneyIntro &&
        e1?.journeyActive == e2?.journeyActive &&
        e1?.priorityActionActive == e2?.priorityActionActive;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.os,
        e?.trackerLinked,
        e?.appleHealthLinked,
        e?.lastDataFetch,
        e?.timezoneOffset,
        e?.dataTypesToDownload,
        e?.gender,
        e?.age,
        e?.todayDataExists,
        e?.activeGameboard,
        e?.phpOnboarded,
        e?.nbaActive,
        e?.nbaSleepCheck,
        e?.ringActivityProgress,
        e?.ringHealthyActionProgress,
        e?.onboardingComplete,
        e?.progress,
        e?.foodExtraGoal,
        e?.nbaAvailable,
        e?.foodExtraGoalUpdate,
        e?.homepageMessageUpdated,
        e?.bmi,
        e?.height,
        e?.heightUnit,
        e?.weight,
        e?.weightUnit,
        e?.waist,
        e?.waistUnit,
        e?.smoking,
        e?.smokingOther,
        e?.smokingYears,
        e?.smokingUnits,
        e?.moderateActivityDays,
        e?.vigorousActivityDays,
        e?.mhAnxious,
        e?.mhWorrying,
        e?.mhInterest,
        e?.mhDepressed,
        e?.mhMood,
        e?.conditions,
        e?.appVersion,
        e?.hfRef,
        e?.bpSys,
        e?.bpDia,
        e?.rhr,
        e?.hrv,
        e?.hrvUnit,
        e?.lastMoodAsked,
        e?.lastMoodSubmitted,
        e?.healthFeedbackAvailable,
        e?.walkthroughHomepageDone,
        e?.rewardsAvailable,
        e?.speechLink,
        e?.vitalityObjectives,
        e?.pathwaySelected,
        e?.pathwayWalkthroughComplete,
        e?.notificationsPersonality,
        e?.notificationsSummary,
        e?.notificationsFormality,
        e?.notificationsFrequency,
        e?.notificationsMotivation,
        e?.notificationsTimeDiscounting,
        e?.communicationTypeLossAversion,
        e?.communicationTypeSocialProofing,
        e?.communicationTypeHyperbolicDiscounting,
        e?.communicationTypeAnchoring,
        e?.communicationCurrentTypes,
        e?.communicationCurrentTimes,
        e?.vgExcoDemoStep,
        e?.stepGoalLow,
        e?.stepGoalStandard,
        e?.stepGoalAdvanced,
        e?.getActiveActive,
        e?.vitalityPoints,
        e?.vitalityStatus,
        e?.phpVitalSigns,
        e?.phpMobilityAssessment,
        e?.phpVisitDoctor,
        e?.phpDigitalHealthProfile,
        e?.phpVitalSignsDone,
        e?.phpMobilityAssessmentDone,
        e?.phpBodyscan,
        e?.phpBodyscanDone,
        e?.phpHealthReview,
        e?.phpHealthReviewDone,
        e?.stepGoalVeryLow,
        e?.hiThreshold,
        e?.hiDays,
        e?.hiFreqValue,
        e?.hiError,
        e?.hiConsistency,
        e?.hiExposure,
        e?.hiDaysTracked,
        e?.hiIntro,
        e?.hiIntroChoice,
        e?.phpJourneyIntro,
        e?.journeyActive,
        e?.priorityActionActive
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
