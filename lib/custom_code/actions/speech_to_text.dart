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

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

Future<String?> speechToText(FFUploadedFile audioRecording) async {
  final tempDir = await getTemporaryDirectory();
  final tempFile = File('${tempDir.path}/audio.m4a');

  // Write the bytes to the temporary file
  await tempFile.writeAsBytes(audioRecording.bytes!);

  final request = http.MultipartRequest(
    'POST',
    Uri.parse('https://api.openai.com/v1/audio/transcriptions'),
  )
    ..headers['Authorization'] =
        'Bearer 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'
    ..files.add(await http.MultipartFile.fromPath(
      'file',
      tempFile.path,
      contentType: MediaType('audio', 'm4a'),
    ))
    ..fields['model'] = 'whisper-1';

  // Send the request
  final streamedResponse = await request.send();

  // Stream the response
  final responseStream = streamedResponse.stream.transform(utf8.decoder);

  String text = '';
  await for (var chunk in responseStream) {
    text = text + chunk;
    // Process each chunk of the response here
    // For example, you can append it to a StringBuffer or handle it directly
  }
  print(jsonDecode(text)['text']);
  return jsonDecode(text)['text'];
}
