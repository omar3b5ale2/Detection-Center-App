part of 'object_detection_cubit.dart';

@immutable
abstract class DetectionState {}

class DetectionInitial extends DetectionState {}

class DetectionLoading extends DetectionState {}

class DetectionSuccess extends DetectionState {
  late final List<dynamic> detections; // Store the detected objects
  DetectionSuccess(this.detections);
}


class DetectionResult extends DetectionState {
  final List<Map<String, dynamic>> results; // List of detected objects
  DetectionResult(this.results);
}

class DetectionError extends DetectionState {
  final String errorMessage;
  DetectionError(this.errorMessage);
}
