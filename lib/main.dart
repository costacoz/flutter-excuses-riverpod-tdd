import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/presentation/pages/excuse_home_page.dart';
import 'package:riverpod_practice/provider_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      child: const App(),
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExcuseHomePage(),
    );
  }
}
