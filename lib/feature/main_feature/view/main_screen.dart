import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/util/custom_app_bar.dart';
import '../../home/view/screens/home_screen.dart';
import '../view-model/main_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PermissionCubit()..checkPermissions(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocListener<PermissionCubit, PermissionState>(
          listener: (context, state) {
            if (state is PermissionGranted) {
              // Navigate to HomeScreen when permissions are granted
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            }
          },
          child: BlocBuilder<PermissionCubit, PermissionState>(
            builder: (context, state) {
              if (state is PermissionLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is PermissionDenied) {
                return Center(
                  child: AlertDialog(
                    title: Text("Permissions Denied"),
                    content: Text(
                        "Please grant all required permissions to use the app."),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await openAppSettings();
                        },
                        child: Text("Open Settings"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<PermissionCubit>().requestPermissions();
                        },
                        child: Text("Request Permissions"),
                      ),
                    ],
                  ),
                );
              }

              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
