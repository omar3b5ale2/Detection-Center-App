import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../object_detection/view-model/cubit/object_detection_cubit.dart';
import '../../../speech_to_text/view-model/cubit/speech_to_text_cubit.dart';
import '../widgets/body_of_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: Center(
         child: Image.asset(Assets.imagesLogo),
       ),
        backgroundColor: AppColors.primary,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SpeechCubit()),
          BlocProvider(create: (_) => DetectionCubit()),
        ],
        child: BodyOfHomeWidget(),
      ),
    );
  }
}


