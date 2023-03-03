import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:radius/pages/auth/dashboard.dart';

import 'constants/constants.dart';
import 'pages/pages.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  late final ValueNotifier<Brightness> _themeModeNotifier = ValueNotifier<Brightness>(Brightness.light);
  late final WidgetsBinding _widgetBinding;
  late final FlutterWindow _window;

  @override
  void initState() {
    _widgetBinding = WidgetsBinding.instance;
    _widgetBinding.addObserver(this);
    _window = _widgetBinding.window;
    _themeModeNotifier.value = _window.platformDispatcher.platformBrightness;
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    _themeModeNotifier.value = _window.platformDispatcher.platformBrightness;
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Brightness>(
      valueListenable: _themeModeNotifier,
      builder: (BuildContext context, Brightness value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Radius',
          theme: darkTheme,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('en', ''),
            Locale('es', ''),
          ],
          initialRoute: welcomeRoute,
          routes: <String, WidgetBuilder>{
            welcomeRoute: (BuildContext context) => const WelcomePage(),
            loginRoute: (BuildContext context) => const LoginPage(),
            registerRoute: (BuildContext context) => const RegisterPage(),
            dashboardRoute: (BuildContext context) => const DashboardPage(),
          },
        );
      }
    );
  }
}
