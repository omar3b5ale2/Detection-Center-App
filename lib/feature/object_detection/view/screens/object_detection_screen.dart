import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/app_colors.dart';
import '../../view-model/cubit/object_detection_cubit.dart';

class DetectionView extends StatelessWidget {
  const DetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetectionCubit, DetectionState>(
      builder: (context, state) {
        if (state is DetectionLoading) {
          return CircularProgressIndicator();
        } else if (state is DetectionResult) {
          return Column(
            children: state.results.map((result) {
              return Text(
                "${result['label']} - ${(result['confidence'] * 100).toStringAsFixed(1)}%",
                style: TextStyle(color: AppColors.text),
              );
            }).toList(),
          );
        } else if (state is DetectionError) {
          return Text("Error: ${state.errorMessage}", style: TextStyle(color: AppColors.error));
        }
        return Text("No objects detected yet.", style: TextStyle(color: AppColors.text));
      },
    );
  }
}
