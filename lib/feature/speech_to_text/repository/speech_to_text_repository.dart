import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/util/fall_back_error.dart';

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
      throw FallbackMessage(message: 'Speech recognition not available.',);
      //Exception("Speech recognition not available.");
    }
  }

  void stopListening() {
    _speechToText.stop();
  }
}
