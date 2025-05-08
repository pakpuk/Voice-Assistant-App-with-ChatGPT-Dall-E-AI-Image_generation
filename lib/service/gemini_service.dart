import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voice_assistant_app/utils/secrets.dart';

class GeminiService {
  static const String apiKey = GeminiApiKey;
  static const String textEndpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';
  static const String visionEndpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';

  static bool isImagePrompt(String userInput) {
    final lowered = userInput.toLowerCase();
    return lowered.contains("image") ||
        lowered.contains("picture") ||
        lowered.contains("photo") ||
        lowered.contains("generate me") ||
        lowered.contains("ارسم") ||
        lowered.contains("صورة");
  }

  static Future<dynamic> getGeminiResponse(String userInput) async {
    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': userInput}
          ]
        }
      ]
    });

    if (isImagePrompt(userInput)) {
      final response = await http.post(
        Uri.parse(visionEndpoint),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        final parts = json['candidates'][0]['content']['parts'];
        for (var part in parts) {
          if (part.containsKey('inlineData')) {
            return part['inlineData']['data'];
          }
        }

        return '⚠️ No image data returned.';
      } else {
        return '❌ Image Error: ${response.body}';
      }
    } else {
      final response = await http.post(
        Uri.parse(textEndpoint),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json['candidates'][0]['content']['parts'][0]['text'] ??
            'No text response';
      } else {
        return '❌ Text Error: ${response.body}';
      }
    }
  }
}
