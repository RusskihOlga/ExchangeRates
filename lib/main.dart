import 'package:exchange_rates/core/database/database.dart';
import 'package:exchange_rates/core/di.dart';
import 'package:exchange_rates/core/router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  await appIns.get<Database>().init();
  await appIns.get<Database>().initBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Курсы валют',
    );
  }
}