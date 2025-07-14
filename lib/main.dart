import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kaspa/core/utils/firebase_options.dart';
import 'package:kaspa/kaspa.dart';
import 'config/di/app_initializer.dart';
import 'core/utils/global_variables.dart';

void main() {
  final completer = Completer<void>();

  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
    _showErrorUI(details.exceptionAsString());
  };

  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: "assets/.env");
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await AppInitializer.initGetIt();

      runApp(
        EasyLocalization(
          supportedLocales: GlobalVariables.appLocales,
          path: 'assets/translations',
          fallbackLocale: const Locale('en', 'GB'),
          saveLocale: true,
          startLocale: const Locale('en', 'GB'),
          useFallbackTranslations: true,
          useOnlyLangCode: true,
          child: const Kaspa(),
        ),
      );
      FlutterNativeSplash.remove();
      completer.complete();
    },
    (error, stackTrace) {
      debugPrint(error.toString());
      // _showErrorUI(error.toString());

      if (!completer.isCompleted) {
        completer.completeError(error, stackTrace);
      }
    },
  );
}

class ErrorHandlerWidget extends StatelessWidget {
  final Widget child;

  const ErrorHandlerWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        try {
          return child;
        } catch (e) {
          //  debugPrint('Root widget error: $e\n$stack');
          return _buildErrorScreen(e.toString(), context);
        }
      },
    );
  }
}

Widget _buildErrorScreen(String error, BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            Text(
              "It's not you, it's us".tr(),
              style: const TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(error, textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () => _restartApp(context),
              child: Text('retry_button'.tr()),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showErrorUI(String error) {
  debugPrint('Showing error UI: $error');
}

void _restartApp(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => const Kaspa()),
    (route) => false,
  );
}
