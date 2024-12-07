import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/custom_app_bar.dart';
import '../../../object_detection/view-model/cubit/object_detection_cubit.dart';
import '../../../speech_to_text/view-model/cubit/speech_to_text_cubit.dart';
import '../widgets/body_of_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SpeechCubit()),
          BlocProvider(create: (_) => DetectionCubit()),
        ],
        child: Center(child: BodyOfHomeWidget()),
      ),
    );
  }
}
