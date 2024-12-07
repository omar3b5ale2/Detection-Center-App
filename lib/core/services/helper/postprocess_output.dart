List<Map<String, dynamic>> postprocessOutput(List<List<double>> rawOutput) {
  final threshold = 0.5; // Confidence threshold for detected objects
  final List<Map<String, dynamic>> detectedObjects = [];

  // Iterate through the raw output and extract meaningful data
  for (int i = 0; i < rawOutput[0].length; i++) {
    final confidence = rawOutput[0][i];
    if (confidence > threshold) {
      // Example label mapping (You need a label file like 'labels.txt')
      final label = _getLabelForIndex(i);
      detectedObjects.add({
        'label': label,
        'confidence': confidence,
        // Optionally, include bounding box coordinates if available
        'boundingBox': {
          'x': rawOutput[1][i], // Example placeholder for X coordinate
          'y': rawOutput[2][i], // Example placeholder for Y coordinate
          'width': rawOutput[3][i], // Example placeholder for width
          'height': rawOutput[4][i], // Example placeholder for height
        }
      });
    }
  }

  return detectedObjects;
}

String _getLabelForIndex(int index) {
  // Map output index to label (this requires a labels.txt file in assets)
  final labels = [
    'background',
    'person',
    'bicycle',
    'car',
    'motorcycle',
    'airplane',
    'bus',
    'train',
    'truck',
    'boat',
    'traffic light',
    'fire hydrant',
    // ... add more labels corresponding to your model's output
  ];

  return labels[index];
}
