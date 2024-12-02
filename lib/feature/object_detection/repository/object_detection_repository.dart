class DetectionRepository {
  Future<List<Map<String, dynamic>>> detectObjects() async {
    return [
      {"label": "Ball", "confidence": 0.95},
      {"label": "Cup", "confidence": 0.89},
    ];
  }
}
