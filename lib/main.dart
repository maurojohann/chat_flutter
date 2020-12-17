import 'package:chat_flutter/utils/default_colors.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/utils/app_routes.dart';
import 'screens/auth_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: DefaultColores.PRIMARY,
        accentColor: DefaultColores.SECUNDARY,
        accentColorBrightness: Brightness.light,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: DefaultColores.TERTIARY,
          textTheme: ButtonTextTheme.normal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthScreen(),
      routes: {
        AppRoutes.CHAT_SCREEN: (ctx) => ChatScreen(),
      },
    );
  }
}
