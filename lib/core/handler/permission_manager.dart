import 'package:permission_handler/permission_handler.dart';
class PermissionsManager {
  static Future<void> requestPermissions() async {
    final microphoneStatus = await Permission.microphone.request();
    final cameraStatus = await Permission.camera.request();
    final storageStatus = await Permission.storage.request();

    if (microphoneStatus.isDenied || cameraStatus.isDenied || storageStatus.isDenied) {
      throw Exception("Required permissions were denied.");
    }

    if (microphoneStatus.isPermanentlyDenied ||
        cameraStatus.isPermanentlyDenied ||
        storageStatus.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  static Future<bool> arePermissionsGranted() async {
    final microphoneStatus = await Permission.microphone.status;
    final cameraStatus = await Permission.camera.status;
    final storageStatus = await Permission.storage.status;

    return microphoneStatus.isGranted && cameraStatus.isGranted && storageStatus.isGranted;
  }
}
