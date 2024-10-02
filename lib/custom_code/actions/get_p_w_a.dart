// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pwa_install/pwa_install.dart';

Future getPWA() async {
  // Add your function code here!
  WidgetsFlutterBinding.ensureInitialized();

  PWAInstall().setup(installCallback: () {
    debugPrint('APP INSTALLED!');
  });

  runApp(MaterialApp(home: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
      title: 'PWA Install',
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Version: 6'),
          Text('Launch Mode: ${PWAInstall().launchMode?.shortLabel}'),
          Text('Has Install Prompt: ${PWAInstall().hasPrompt}'),
          if (PWAInstall().installPromptEnabled)
            ElevatedButton(
                onPressed: () {
                  try {
                    PWAInstall().promptInstall_();
                  } catch (e) {
                    setState(() {
                      error = e.toString();
                    });
                  }
                },
                child: const Text('Install')),
          if (error != null) Text(error!)
        ],
      ),
    ));
  }
}
