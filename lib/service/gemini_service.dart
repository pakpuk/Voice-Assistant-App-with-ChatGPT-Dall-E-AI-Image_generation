import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voice_assistant_app/utils/secrets.dart';

class GeminiService {
  static const String apiKey = GeminiApiKey;
  static const String textEndpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey';
  static const String visionEndpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key=$apiKey';

  /// This function checks if the prompt is a request for an image
  static bool isImagePrompt(String userInput) {
    final lowered = userInput.toLowerCase();
    return lowered.contains("image") ||
        lowered.contains("picture") ||
        lowered.contains("photo") ||
        lowered.contains("generate me") ||
        lowered.contains("ارسم") ||
        lowered.contains("صورة");
  }

  /// Handles both image and text requests
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
      // Handle image generation
      final response = await http.post(
        Uri.parse(visionEndpoint),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        // Check for inlineData (image base64)
        final parts = json['candidates'][0]['content']['parts'];
        for (var part in parts) {
          if (part.containsKey('inlineData')) {
            return part['inlineData']['data']; // base64 image
          }
        }

        return '⚠️ No image data returned.';
      } else {
        return '❌ Image Error: ${response.body}';
      }
    } else {
      // Handle text response
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
