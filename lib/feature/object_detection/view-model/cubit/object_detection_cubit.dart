// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
//
// part 'object_detection_state.dart';
//
// class DetectionCubit extends Cubit<DetectionState> {
//   Interpreter? _interpreter;
//   DetectionCubit() : super(DetectionInitial());
//   // Load model from asset
//   Future<void> loadModel() async {
//     try {
//       emit(DetectionLoading());
//       _interpreter = await Interpreter.fromAsset('assets/model/mobilenet_v1_1.0_224.tflite');
//       emit(DetectionSuccess([])); // Empty list on initial load
//     } catch (e) {
//       emit(DetectionError('Error loading model: $e'));
//     }
//   }
//   Future<void> detectObjects() async {
//     try {
//       emit(DetectionLoading());
//
//       await Future.delayed(Duration(seconds: 2));
//       List<Map<String, dynamic>> detectedObjects = [
//         {"label": "Ball", "confidence": 0.95},
//         {"label": "Cup", "confidence": 0.89},
//       ];
//       emit(DetectionResult(detectedObjects));
//     } catch (e) {
//       emit(DetectionError("Unable to detect objects. Try again."));
//     }
//   }
//   @override
//   Future<void> close() async {
//     _interpreter!.close();
//     super.close();
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

part 'object_detection_state.dart';

class DetectionCubit extends Cubit<DetectionState> {
  Interpreter? _interpreter;
  bool isCameraInitialized = false;

  DetectionCubit() : super(DetectionInitial());

  // Load the model and initialize the camera
  Future<void> loadModel() async {
    try {
      emit(DetectionLoading());
      _interpreter = await Interpreter.fromAsset('assets/model/mobilenet_v1_1.0_224.tflite');
      emit(DetectionModelLoaded());  // State indicating model is loaded
      // Initialize camera logic here, for example:
      isCameraInitialized = true; // simulate camera initialization
      emit(DetectionCameraInitialized()); // State indicating camera is initialized
    } catch (e) {
      emit(DetectionError('Error loading model or initializing camera: $e'));
    }
  }

  // Detect objects
  Future<void> detectObjects() async {
    if (!isCameraInitialized) {
      emit(DetectionError("Camera not initialized. Please wait."));
      return;
    }

    if (_interpreter == null) {
      emit(DetectionError("Model not loaded. Please wait."));
      return;
    }

    try {
      emit(DetectionLoading());
      await Future.delayed(Duration(seconds: 2)); // Simulate detection process
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
    _interpreter?.close();
    super.close();
  }
}
