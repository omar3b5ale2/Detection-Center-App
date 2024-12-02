import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'object_detection_state.dart';

class DetectionCubit extends Cubit<DetectionState> {
  DetectionCubit() : super(DetectionInitial());

  Future<void> detectObjects() async {
    try {
      emit(DetectionLoading());

      await Future.delayed(Duration(seconds: 2));
      List<Map<String, dynamic>> detectedObjects = [
        {"label": "Ball", "confidence": 0.95},
        {"label": "Cup", "confidence": 0.89},
      ];
      emit(DetectionResult(detectedObjects));
    } catch (e) {
      emit(DetectionError("Unable to detect objects. Try again."));
    }
  }
}
