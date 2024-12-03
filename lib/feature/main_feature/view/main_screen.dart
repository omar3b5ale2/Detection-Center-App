import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/handler/permission_manager.dart';
import '../../../generated/assets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Image.asset(Assets.imagesLogo),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: PermissionsManager.arePermissionsGranted(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (!snapshot.data!) {
              return AlertDialog(
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
                ],
              );
            }

            return Text("Permissions Granted. Ready to use the app!");
          },
        ),
      ),
    );
  }
}
