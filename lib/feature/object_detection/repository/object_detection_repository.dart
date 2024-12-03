import 'package:camera/camera.dart';

class DetectionRepository {
  CameraController? _cameraController;

  Future<CameraController> getCamera() async {
    if (_cameraController == null) {
      final cameras = await availableCameras();
      _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
      await _cameraController!.initialize();
    }
    return _cameraController!;
  }

  void disposeCamera() {
    _cameraController?.dispose();
    _cameraController = null;
  }
}
