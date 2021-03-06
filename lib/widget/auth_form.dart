import 'dart:io';

import 'package:chat_flutter/models/auth_data.dart';
import 'package:chat_flutter/widget/user_image_picker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  //onSubmit recebe a Funcçao herdada do pai, para retornar os valores cadastradors no Form
  final void Function(AuthData authData) onSubmit;
  AuthForm(this.onSubmit);
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthData _authData = AuthData();

  _submit() {
    bool isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (_authData.image == null && _authData.isSignup) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Adicione imagem do perfil'),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }
    if (isValid) {
      widget.onSubmit(_authData);
    }
  }

  void _handlePickedImage(File image) {
    _authData.image = image;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (_authData.isSignup) UserImagePicker(_handlePickedImage),
                  if (_authData.isSignup)
                    TextFormField(
                      key: ValueKey('name'),
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                      initialValue: _authData.name,
                      onChanged: (value) => _authData.name = value,
                      validator: (value) {
                        if (value == null || value.trim().length < 4) {
                          return 'Nome Invalido';
                        }
                        return null;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                    onChanged: (value) => _authData.email = value,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'E-mail invalido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                    onChanged: (value) => _authData.password = value,
                    validator: (value) {
                      if (value == null || value.trim().length < 7) {
                        return 'Senha Invalida';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                    onPressed: _submit,
                    child: Text(_authData.isLogin ? 'Entrar' : 'Cadastrar'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(_authData.isLogin
                        ? 'Criar Uma Nova Conta?'
                        : 'Entrar com Login?'),
                    onPressed: () {
                      setState(() {
                        _authData.toggleMode();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
