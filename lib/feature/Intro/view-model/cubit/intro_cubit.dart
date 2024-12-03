import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/intro_repository.dart';
import '../../view/widgets/introduction_page.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  final IntroRepository _introductionRepository = IntroRepository();
  IntroCubit() : super(IntroductionInitialized());

  startIntroduction() => emit(IntroductionBegin(
      _introductionRepository.getAllIntroductionModelsAsPages()));
  introductionCompleted() => emit(IntroductionCompleted());
  getIntroductionRepository() => _introductionRepository;
}
