import 'package:chat_app/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: AuthForm(),
          ),
        ),
      ),
    );
  }
}
