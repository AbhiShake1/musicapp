import 'package:flutter/material.dart';
import 'package:fyp/feature/home/views/home.dart';
import 'package:fyp/feature/login/views/login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/preferences.dart';

late final String? uid;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  uid = await Preferences.getString('uid_key');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: uid == null ? const LoginPage() : const HomePage());
  }
}
