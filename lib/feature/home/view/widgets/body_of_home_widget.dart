// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pyramakerz_assement/core/constants/app_texts.dart';
//
// import '../../../../core/constants/app_constants.dart';
// import '../../../../core/util/app_colors.dart';
// import '../../../object_detection/view-model/cubit/object_detection_cubit.dart';
// import '../../../speech_to_text/view-model/cubit/speech_to_text_cubit.dart';
//
// class BodyOfHomeWidget extends StatelessWidget {
//   const BodyOfHomeWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Dropdown for language selection
//         DropdownButton<String>(
//           items: [
//             DropdownMenuItem(value: 'en_US', child: Text("English")),
//             DropdownMenuItem(value: 'ar_SA', child: Text("Arabic")),
//             DropdownMenuItem(value: 'es_ES', child: Text("Spanish")),
//             DropdownMenuItem(value: 'fr_FR', child: Text("French")),
//           ],
//           onChanged: (value) {
//             if (value != null) {
//               context.read<SpeechCubit>().setLanguage(value);
//             }
//           },
//           hint: Text("Select Language"),
//         ),
//         AppConstants.userVerticalSpace20,
//         // Speech recognition UI
//         BlocBuilder<SpeechCubit, SpeechState>(
//           builder: (context, speechState) {
//             String message = AppTexts.startingMessage;
//             if (speechState is SpeechListening) {
//               message = "Listening...";
//             } else if (speechState is SpeechRecognized) {
//               message = speechState.recognizedText;
//               if (speechState.recognizedText.contains("what is this") ||
//                   speechState.recognizedText.contains("ما هذا") ||
//                   speechState.recognizedText.contains("Qué es esto") ||
//                   speechState.recognizedText.contains("Qu’est-ce que c est")) {
//                 context.read<DetectionCubit>().detectObjects();
//               }
//             } else if (speechState is SpeechError) {
//               message = speechState.errorMessage;
//             }
//             return Text(
//               message,
//               style: TextStyle(color: AppColors.textColorLight, fontSize: 18.sp),
//               textAlign: TextAlign.center,
//             );
//           },
//         ),
//         AppConstants.userVerticalSpace20,
//         ElevatedButton(
//           onPressed: () => context.read<SpeechCubit>().startListening(),
//           style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.lightBlueGray),
//           child: Text("Start Listening"),
//         ),
//         AppConstants.userVerticalSpace40,
//
//         // Object detection UI
//         BlocBuilder<DetectionCubit, DetectionState>(
//           builder: (context, detectionState) {
//             if (detectionState is DetectionLoading) {
//               return CircularProgressIndicator();
//             } else if (detectionState is DetectionResult) {
//               return Column(
//                 children: detectionState.results.map((result) {
//                   return Text(
//                     "${result['label']} (${(result['confidence'] * 100).toStringAsFixed(2)}%)",
//                     style: TextStyle(color: AppColors.textColorLight,fontSize: 16.sp),
//                   );
//                 }).toList(),
//               );
//             } else if (detectionState is DetectionError) {
//               return Text(
//                 detectionState.errorMessage,
//                 style: TextStyle(color: AppColors.error, fontSize: 16.sp),
//               );
//             }
//             return Text(
//               "Awaiting object detection...",
//               style: TextStyle(color: AppColors.textColorLight, fontSize: 14.sp),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_assement/core/constants/app_texts.dart';
import '../../../../core/config/themes/cubit/theme_cubit.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/util/app_colors.dart';
import '../../../object_detection/view-model/cubit/object_detection_cubit.dart';
import '../../../speech_to_text/view-model/cubit/speech_to_text_cubit.dart';

class BodyOfHomeWidget extends StatelessWidget {
  const BodyOfHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Dropdown for language selection
              DropdownButton<String>(
                items: [
                  DropdownMenuItem(value: 'en_US', child: Text("English")),
                  DropdownMenuItem(value: 'ar_SA', child: Text("Arabic")),
                  DropdownMenuItem(value: 'es_ES', child: Text("Spanish")),
                  DropdownMenuItem(value: 'fr_FR', child: Text("French")),
                ],
                onChanged: (value) {
                  if (value != null) {
                    context.read<SpeechCubit>().setLanguage(value);
                  }
                },
                hint: Text(
                  "Select Language",
                  style: TextStyle(fontSize: 16.sp),
                ),
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
                        speechState.recognizedText.contains("ما هذا") ||
                        speechState.recognizedText.contains("Qué es esto") ||
                        speechState.recognizedText.contains("Qu’est-ce que c est")) {
                      context.read<DetectionCubit>().detectObjects();
                    }
                  } else if (speechState is SpeechError) {
                    message = speechState.errorMessage;
                  }
                  return Text(
                    message,
                    style: TextStyle(
                      color: AppColors.textColorLight,
                      fontSize: 18.sp,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              AppConstants.userVerticalSpace20,

              // Start listening button
              ElevatedButton(
                onPressed: () => context.read<SpeechCubit>().startListening(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBlueGray,
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                ),
                child: Text(
                  "Start Listening",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              AppConstants.userVerticalSpace40,

              // Object detection UI
              BlocBuilder<DetectionCubit, DetectionState>(
                builder: (context, detectionState) {
                  if (detectionState is DetectionLoading) {
                    return const CircularProgressIndicator();
                  } else if (detectionState is DetectionResult) {
                    return Column(
                      children: detectionState.results.map((result) {
                        return Text(
                          "${result['label']} (${(result['confidence'] * 100).toStringAsFixed(2)}%)",
                          style: TextStyle(
                            color: AppColors.textColorLight,
                            fontSize: 16.sp,
                          ),
                        );
                      }).toList(),
                    );
                  } else if (detectionState is DetectionError) {
                    return Text(
                      detectionState.errorMessage,
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 16.sp,
                      ),
                    );
                  }
                  return Text(
                    "Awaiting object detection...",
                    style: TextStyle(
                      color: AppColors.textColorLight,
                      fontSize: 14.sp,
                    ),
                  );
                },
              ),

              AppConstants.userVerticalSpace20,

              // Theme toggle button
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeState is ThemeLightState
                      ? AppColors.primary
                      : AppColors.accent,
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                ),
                child: Text(
                  themeState is ThemeLightState ? "Switch to Dark Theme" : "Switch to Light Theme",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
