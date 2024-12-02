import 'package:speech_to_text/speech_to_text.dart';

class SpeechRepository {
  final SpeechToText _speechToText = SpeechToText();

  Future<String> listenToSpeech(String languageCode) async {
    if (await _speechToText.initialize()) {
      String result = "";
      await _speechToText.listen(
        localeId: languageCode,
        onResult: (speechResult) {
          result = speechResult.recognizedWords;
        },
      );
      return result;
    } else {
      throw Exception("Speech recognition not available.");
    }
  }

  void stopListening() {
    _speechToText.stop();
  }
}
