import 'package:chat_flutter/utils/default_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/utils/app_routes.dart';
import 'screens/auth_screen.dart';
import 'screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _init = Firebase.initializeApp();
    return FutureBuilder(
        future: _init,
        builder: (context, appShapshot) {
          return MaterialApp(
            title: 'Flutter Chat',
            theme: ThemeData(
              primarySwatch: Colors.teal,
              backgroundColor: DefaultColors.PRIMARY,
              accentColor: DefaultColors.SECUNDARY,
              accentColorBrightness: Brightness.light,
              buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: DefaultColors.TERTIARY,
                textTheme: ButtonTextTheme.normal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: appShapshot.connectionState == ConnectionState.waiting
                ? SplashScreen()
                : StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ChatScreen();
                      } else {
                        return AuthScreen();
                      }
                    },
                  ),
            routes: {
              AppRoutes.CHAT_SCREEN: (ctx) => ChatScreen(),
            },
          );
        });
  }
}
