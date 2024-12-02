import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

part 'object_detection_state.dart';

class DetectionCubit extends Cubit<DetectionState> {
  late Interpreter _interpreter;
  DetectionCubit() : super(DetectionInitial());
  // Load model from asset
  Future<void> loadModel() async {
    try {
      emit(DetectionLoading());
      _interpreter = await Interpreter.fromAsset('assets/model/mobilenet_v1_1.0_224.tflite');
      emit(DetectionSuccess([])); // Empty list on initial load
    } catch (e) {
      emit(DetectionError('Error loading model: $e'));
    }
  }
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
  @override
  Future<void> close() async {
    _interpreter.close();
    super.close();
  }
}
