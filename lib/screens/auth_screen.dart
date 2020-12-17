import 'package:chat_flutter/models/auth_data.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/widget/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _handleSubmit(AuthData authData) {
    print(authData.email);
    print(authData.name);
    print(authData.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AuthForm(_handleSubmit),
    );
  }
}
