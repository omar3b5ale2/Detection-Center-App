import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_assement/core/constants/app_texts.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/util/app_colors.dart';
import '../../../object_detection/view-model/cubit/object_detection_cubit.dart';
import '../../../speech_to_text/view-model/cubit/speech_to_text_cubit.dart';

class BodyOfHomeWidget extends StatelessWidget {
  const BodyOfHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Dropdown for language selection
        DropdownButton<String>(
          items: [
            DropdownMenuItem(value: 'en_US', child: Text("English")),
            DropdownMenuItem(value: 'ar_SA', child: Text("Arabic")),
          ],
          onChanged: (value) {
            if (value != null) {
              context.read<SpeechCubit>().setLanguage(value);
            }
          },
          hint: Text("Select Language"),
        ),
        AppConstants.userVerticalSpace20,
        // Speech recognition UI
        BlocBuilder<SpeechCubit, SpeechState>(
          builder: (context, speechState) {
            String message = AppTexts.startingMessage;
            if (speechState is SpeechListening) {
              message = "Listening...";
            } else if (speechState is SpeechRecognized) {
              message = speechState.recognizedText;
              if (speechState.recognizedText.contains("what is this") ||
                  speechState.recognizedText.contains("ما هذا")) {
                context.read<DetectionCubit>().detectObjects();
              }
            } else if (speechState is SpeechError) {
              message = speechState.errorMessage;
            }
            return Text(
              message,
              style: TextStyle(color: AppColors.text, fontSize: 18.sp),
              textAlign: TextAlign.center,
            );
          },
        ),
        AppConstants.userVerticalSpace20,
        ElevatedButton(
          onPressed: () => context.read<SpeechCubit>().startListening(),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: Text("Start Listening"),
        ),
        AppConstants.userVerticalSpace40,

        // Object detection UI
        BlocBuilder<DetectionCubit, DetectionState>(
          builder: (context, detectionState) {
            if (detectionState is DetectionLoading) {
              return CircularProgressIndicator();
            } else if (detectionState is DetectionResult) {
              return Column(
                children: detectionState.results.map((result) {
                  return Text(
                    "${result['label']} (${(result['confidence'] * 100).toStringAsFixed(2)}%)",
                    style: TextStyle(color: AppColors.text, fontSize: 16.sp),
                  );
                }).toList(),
              );
            } else if (detectionState is DetectionError) {
              return Text(
                detectionState.errorMessage,
                style: TextStyle(color: AppColors.error),
              );
            }
            return Text(
              "Awaiting object detection...",
              style: TextStyle(color: AppColors.textSecondary),
            );
          },
        ),
      ],
    );
  }
}