import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/binding/user_binding.dart';
import 'package:flutter_getx_palette_diary/src/view/login_page.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),
      home: LoginPage(),
      initialBinding: UserBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
