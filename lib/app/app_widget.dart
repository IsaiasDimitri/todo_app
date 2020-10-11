import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: MaterialColor(1, {1: Colors.black}),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          // button: TextStyle(color: Colors.black45),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(.5)),
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
