# pyramakerz_assessment

Detection Center App.

# Flutter Speech Recognition & Object Detection App

## Overview
This Flutter app combines real-time **speech recognition** and **object detection**. Users can interact with the app using voice commands (e.g., "What is this?") to detect and label objects in real time.

### Features
1. *Speech Recognition*:
    - Real-time voice-to-text functionality.
    - Multilingual support (English and Arabic).
    - Graceful handling of unclear commands or background noise with fallback messages.
   
2. *Object Detection*:
   - Detects and labels common objects in real-time using the camera.
   - Supports multiple objects simultaneously.
   - Displays bounding boxes and labels for detected objects.
   
3. *Feature Integration*:
   - Voice-triggered object detection (e.g., "What is this?").
   - Simultaneous use of speech recognition and object detection.
   
- **Multilingual Speech Recognition**: Supports commands in English and Arabic.
- **Real-Time Object Detection**: Identifies and labels multiple objects simultaneously.
- **Graceful Error Handling**: Displays fallback messages for unrecognized input or partial object views.
- **Provides meaningful messages for errors** (e.g., "Command not recognized").
- **Handles background noise effectively**.

### Technologies Used
- **Flutter Framework**: Cross-platform UI development.
- **onboarding**: Onboarding Ui.
- **google_fonts**: fonts family.
- **Cubit (Bloc)**: State management.
- **Speech to Text**: Speech recognition library.
- **TensorFlow Lite (or MLKit)**: Object detection library.
- **ScreenUtils**: Responsive UI.
- **Camera**: Supports previewing the camera feed, capturing images and video, and streaming image.

### Architecture
The app follows the **MVVM** architecture:
- **Model**: Represents data (e.g., detected objects, languages).
- **View**: Responsible for UI.
- **ViewModel (Cubit)**: Manages state and app logic.
- **Repository**: Handles data and API interactions.

## Permissions Required
The app requires the following permissions to function properly:

1. **Camera**: For real-time object detection.
2. **Microphone**: For speech recognition.
3. **Storage**: To access and save required assets.

### Setup Instructions for Permissions
- **Android**:
   - Ensure the following permissions are added in `AndroidManifest.xml`:
      - `android.permission.CAMERA`
      - `android.permission.RECORD_AUDIO`
      - `android.permission.WRITE_EXTERNAL_STORAGE`

- **iOS**:
   - Add the following keys to `Info.plist`:
      - `NSCameraUsageDescription`
      - `NSMicrophoneUsageDescription`

### Runtime Permissions Handling
The app uses the `permission_handler` package for dynamic permissions. If any permissions are denied:
- A fallback error message will be displayed.
- For permanently denied permissions, the app prompts the user to open the settings page.

## Setup Instructions
1. *Clone the Repository*:
   bash
   git clone <repository_url>
   cd <repository_folder>

2. *Install Dependencies*:
   Ensure you have Flutter installed. Run:
   bash
   flutter pub get

3. *Add TensorFlow Lite Model*:
    - Download a pre-trained TensorFlow Lite model (e.g., mobilenet_v1_1.0_224.tflite).
    - Place the model file in the assets folder.
    - Update the pubspec.yaml file:
      yaml
      assets:
        - assets/mobilenet_v1_1.0_224.tflite

4. *Run the App*:
    - Connect a device or start an emulator.
    - Run:
      bash
      flutter run
5. *Enable Multilingual Speech Recognition*:
   Modify the speech_repository.dart file to include supported locales, such as:
   -en-US: English (United States)
   -ar-SA: Arabic (Saudi Arabia)

*Run Object Detection*:
- Place your TensorFlow Lite models in the assets/ directory.
- Configure the models in the pubspec.yaml file under the assets section:
- yaml
assets:
- assets/model.tflite
- assets/labels.txt

      