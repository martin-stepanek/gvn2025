import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI Group Code

class OpenAIGroup {
  static String getBaseUrl({
    String? model = 'gpt-4-turbo-preview',
    dynamic messagesJson,
    double? temperature = 1,
    int? n = 1,
    bool? stream,
    double? presencePenalty = 0,
    double? frequencyPenalty = 0,
    int? maxTokens = 4096,
    List<String>? stopList,
  }) =>
      'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer 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',
  };
  static FoodAnalysisCall foodAnalysisCall = FoodAnalysisCall();
  static CoachCall coachCall = CoachCall();
  static FoodSearchCall foodSearchCall = FoodSearchCall();
  static SpeechToTextCall speechToTextCall = SpeechToTextCall();
}

class FoodAnalysisCall {
  Future<ApiCallResponse> call({
    String? model = 'gpt-4-turbo-preview',
    dynamic messagesJson,
    double? temperature = 1,
    int? n = 1,
    bool? stream,
    double? presencePenalty = 0,
    double? frequencyPenalty = 0,
    int? maxTokens = 4096,
    List<String>? stopList,
  }) async {
    final baseUrl = OpenAIGroup.getBaseUrl(
      model: model,
      messagesJson: messagesJson,
      temperature: temperature,
      n: n,
      stream: stream,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      maxTokens: maxTokens,
      stopList: stopList,
    );
    final stop = _serializeList(stopList);
    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "model": "$model",
  "messages": $messages,
  "max_tokens": 4096
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FoodAnalysis',
      apiUrl: '$baseUrl/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[0].message.content''',
      );
}

class CoachCall {
  Future<ApiCallResponse> call({
    String? model = 'gpt-4-turbo-preview',
    dynamic messagesJson,
    double? temperature = 1,
    int? n = 1,
    bool? stream,
    double? presencePenalty = 0,
    double? frequencyPenalty = 0,
    int? maxTokens = 4096,
    List<String>? stopList,
  }) async {
    final baseUrl = OpenAIGroup.getBaseUrl(
      model: model,
      messagesJson: messagesJson,
      temperature: temperature,
      n: n,
      stream: stream,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      maxTokens: maxTokens,
      stopList: stopList,
    );
    final stop = _serializeList(stopList);
    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "model": "$model",
  "messages": $messages,
  "max_tokens": 4096
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Coach',
      apiUrl: '$baseUrl/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[0].message.content''',
      );
  dynamic tokensTotal(dynamic response) => getJsonField(
        response,
        r'''$.usage.total_tokens''',
      );
  dynamic tokensCompletion(dynamic response) => getJsonField(
        response,
        r'''$.usage.completion_tokens''',
      );
  dynamic tokensPrompt(dynamic response) => getJsonField(
        response,
        r'''$.usage.prompt_tokens''',
      );
}

class FoodSearchCall {
  Future<ApiCallResponse> call({
    String? model = 'gpt-4-turbo-preview',
    dynamic messagesJson,
    double? temperature = 1,
    int? n = 1,
    bool? stream,
    double? presencePenalty = 0,
    double? frequencyPenalty = 0,
    int? maxTokens = 4096,
    List<String>? stopList,
  }) async {
    final baseUrl = OpenAIGroup.getBaseUrl(
      model: model,
      messagesJson: messagesJson,
      temperature: temperature,
      n: n,
      stream: stream,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      maxTokens: maxTokens,
      stopList: stopList,
    );
    final stop = _serializeList(stopList);
    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "model": "$model",
  "messages": $messages,
  "max_tokens": 4096
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FoodSearch',
      apiUrl: '$baseUrl/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SpeechToTextCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? model = 'gpt-4-turbo-preview',
    dynamic messagesJson,
    double? temperature = 1,
    int? n = 1,
    bool? stream,
    double? presencePenalty = 0,
    double? frequencyPenalty = 0,
    int? maxTokens = 4096,
    List<String>? stopList,
  }) async {
    final baseUrl = OpenAIGroup.getBaseUrl(
      model: model,
      messagesJson: messagesJson,
      temperature: temperature,
      n: n,
      stream: stream,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      maxTokens: maxTokens,
      stopList: stopList,
    );
    final stop = _serializeList(stopList);
    final messages = _serializeJson(messagesJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'SpeechToText',
      apiUrl: '$baseUrl/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'model': "whisper-1",
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OpenAI Group Code

/// Start Azure Group Code

class AzureGroup {
  static String getBaseUrl({
    dynamic messagesJson,
    double? temperature = 1,
    bool? stream,
    double? presencePenalty = 0,
    double? frequencyPenalty = 0,
    int? maxTokens = 4096,
    double? topP = 0.95,
  }) =>
      'https://ai-azureaivriopenai284425996296.openai.azure.com/openai/deployments';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'api-key': '8b79059672524678987b436e1694da64',
  };
  static AZcoachThreePointFiveCall aZcoachThreePointFiveCall =
      AZcoachThreePointFiveCall();
  static AZcoachFourCall aZcoachFourCall = AZcoachFourCall();
}

class AZcoachThreePointFiveCall {
  Future<ApiCallResponse> call({
    dynamic messagesJson,
    double? temperature = 1,
    bool? stream,
    double? presencePenalty = 0,
    double? frequencyPenalty = 0,
    int? maxTokens = 4096,
    double? topP = 0.95,
  }) async {
    final baseUrl = AzureGroup.getBaseUrl(
      messagesJson: messagesJson,
      temperature: temperature,
      stream: stream,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      maxTokens: maxTokens,
      topP: topP,
    );

    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "messages": $messages,
  "max_tokens": $maxTokens,
  "temperature": $temperature,
  "frequency_penalty": $frequencyPenalty,
  "presence_penalty": $presencePenalty,
  "top_p": $topP
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AZcoachThreePointFive',
      apiUrl:
          '$baseUrl/gpt-35-turbo/chat/completions?api-version=2023-03-15-preview',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'api-key': '8b79059672524678987b436e1694da64',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[0].message.content''',
      );
  dynamic tokensTotal(dynamic response) => getJsonField(
        response,
        r'''$.usage.total_tokens''',
      );
  dynamic tokensCompletion(dynamic response) => getJsonField(
        response,
        r'''$.usage.completion_tokens''',
      );
  dynamic tokensPrompt(dynamic response) => getJsonField(
        response,
        r'''$.usage.prompt_tokens''',
      );
}

class AZcoachFourCall {
  Future<ApiCallResponse> call({
    dynamic messagesJson,
    double? temperature = 1,
    bool? stream,
    double? presencePenalty = 0,
    double? frequencyPenalty = 0,
    int? maxTokens = 4096,
    double? topP = 0.95,
  }) async {
    final baseUrl = AzureGroup.getBaseUrl(
      messagesJson: messagesJson,
      temperature: temperature,
      stream: stream,
      presencePenalty: presencePenalty,
      frequencyPenalty: frequencyPenalty,
      maxTokens: maxTokens,
      topP: topP,
    );

    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "messages": $messages,
  "max_tokens": $maxTokens,
  "temperature": $temperature,
  "frequency_penalty": $frequencyPenalty,
  "presence_penalty": $presencePenalty,
  "top_p": $topP
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AZcoachFour',
      apiUrl:
          '$baseUrl/gpt-4/chat/completions?api-version=2023-03-15-preview',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'api-key': '8b79059672524678987b436e1694da64',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[0].message.content''',
      );
  dynamic tokensTotal(dynamic response) => getJsonField(
        response,
        r'''$.usage.total_tokens''',
      );
  dynamic tokensCompletion(dynamic response) => getJsonField(
        response,
        r'''$.usage.completion_tokens''',
      );
  dynamic tokensPrompt(dynamic response) => getJsonField(
        response,
        r'''$.usage.prompt_tokens''',
      );
}

/// End Azure Group Code

class GenerateSpeechResponseCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "$prompt",
  "uid": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GenerateSpeechResponse',
      apiUrl:
          'https://us-central1-vitality-smart-coach.cloudfunctions.net/generateSpeechResponse',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBodyScanWebpageCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "scope": [
    "api.platform.bodygram.com/scans:create"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBodyScanWebpage',
      apiUrl:
          'https://platform.bodygram.com/api/orgs/org_NanXjgM6FZ2qkFVKtazGj/scan-tokens',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'SX5dzKW8jqLfpw1hq3gqed6LcsLQtyo2mYgA8h6t9Uv',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static int? expiration(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expiresAt''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
