import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_to_text_state.dart';
class SpeechCubit extends Cubit<SpeechState> {
  final SpeechToText _speechToText = SpeechToText();
  String _languageCode = 'en_US';

  SpeechCubit() : super(SpeechInitial());

  void setLanguage(String languageCode) {
    _languageCode = languageCode;
    emit(SpeechInitial(message: "Language set to $_languageCode."));
  }

  Future<void> startListening() async {

    bool available = await _speechToText.initialize(onError: (error) {
      emit(SpeechError("Error: ${error.errorMsg}"));
    });

    if (available) {
      emit(SpeechListening());
      _speechToText.listen(
        localeId: _languageCode,
        onResult: (result) {
          String command = result.recognizedWords.toLowerCase();
          if (command.isNotEmpty) {
            emit(SpeechRecognized(command));
          } else {
            emit(SpeechError("Unclear command. Please try again."));
          }
        },
      );
    } else {
      emit(SpeechError("Speech recognition unavailable. Check permissions."));
    }
  }

  void stopListening() {
    _speechToText.stop();
    emit(SpeechInitial());
  }
}
