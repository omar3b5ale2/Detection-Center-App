
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/splash_model.dart';
import '../../repository/splash_repository.dart';

part 'splash_state.dart';
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialized());

  final SplashRepository _repository = SplashRepository();
  getSplashRepository() => _repository;
  
  startSplash() => emit(SplashBegin(_repository.getSplashModel()));
  splashCompleted() => emit(SplashCompleted(_repository.getSplashModel()));
}