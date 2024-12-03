part of 'main_cubit.dart';

abstract class PermissionState {}

class PermissionInitial extends PermissionState {}

class PermissionLoading extends PermissionState {}

class PermissionGranted extends PermissionState {}

class PermissionDenied extends PermissionState {}
