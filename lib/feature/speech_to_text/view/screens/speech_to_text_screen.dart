import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/app_colors.dart';
import '../../view-model/cubit/speech_to_text_cubit.dart';

class SpeechView extends StatelessWidget {
  const SpeechView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechCubit, SpeechState>(
      builder: (context, state) {
        if (state is SpeechListening) {
          return Text("Listening...", style: TextStyle(color: AppColors.text));
        } else if (state is SpeechRecognized) {
          return Text("Command: ${state.recognizedText}", style: TextStyle(color: AppColors.text));
        } else if (state is SpeechError) {
          return Text("Error: ${state.errorMessage}", style: TextStyle(color: AppColors.error));
        }
        return Text("Press the button to start.", style: TextStyle(color: AppColors.text));
      },
    );
  }
}
