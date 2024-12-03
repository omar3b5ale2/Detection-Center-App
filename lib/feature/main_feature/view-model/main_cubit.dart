import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'main_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionInitial());

  // Check permissions on app startup
  Future<void> checkPermissions() async {
    emit(PermissionLoading());
    try {
      final permissionsGranted = await _arePermissionsGranted();
      if (permissionsGranted) {
        emit(PermissionGranted());
      } else {
        emit(PermissionDenied());
      }
    } catch (e) {
      emit(PermissionError("Failed to check permissions: ${e.toString()}"));
    }
  }

  // Request permissions
  Future<void> requestPermissions() async {
    emit(PermissionLoading());
    try {
      final statuses = await [
        Permission.microphone,
        Permission.camera,
        Permission.storage,
      ].request();

      final permissionsGranted = statuses.values.every((status) => status.isGranted);

      if (permissionsGranted) {
        emit(PermissionGranted());
      } else {
        emit(PermissionDenied());
      }
    } catch (e) {
      emit(PermissionError("Failed to request permissions: ${e.toString()}"));
    }
  }

  // Helper method to check all required permissions
  Future<bool> _arePermissionsGranted() async {
    final microphoneStatus = await Permission.microphone.isGranted;
    final cameraStatus = await Permission.camera.isGranted;
    final storageStatus = await Permission.storage.isGranted;

    return microphoneStatus && cameraStatus && storageStatus;
  }
}
