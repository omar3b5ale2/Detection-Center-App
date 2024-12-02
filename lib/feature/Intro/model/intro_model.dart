import 'package:flutter/material.dart';

class IntroModel {
  const IntroModel({
    required this.introductionTitle,
    required this.introductionDescription,
    required this.introductionIconWidget
  });
  final String introductionTitle;
  final String introductionDescription;
  final Widget introductionIconWidget;
}