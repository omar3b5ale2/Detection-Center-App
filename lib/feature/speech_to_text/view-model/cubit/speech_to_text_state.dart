part of 'speech_to_text_cubit.dart';

@immutable
abstract class SpeechState {}

class SpeechInitial extends SpeechState {
  final String message;
  SpeechInitial({this.message = "Press the button to start listening."});
}

class SpeechListening extends SpeechState {}

class SpeechRecognized extends SpeechState {
  final String recognizedText;
  SpeechRecognized(this.recognizedText);
}

class SpeechError extends SpeechState {
  final String errorMessage;
  SpeechError(this.errorMessage);
}
