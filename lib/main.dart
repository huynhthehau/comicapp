import 'package:comic_app/detail_comic.dart';
import 'package:comic_app/home_screen_anmie.dart';
import 'package:comic_app/login.dart';
import 'package:comic_app/provider/comicProvider.dart';
import 'package:comic_app/provider/user.dart';
import 'package:comic_app/signup.dart';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ComicProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: DevicePreview(
          enabled: true,
          builder: (context) => const MyApp(), // Wrap your app
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        color: Colors.white,
      )),
      darkTheme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}
