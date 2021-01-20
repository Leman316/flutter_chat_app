import 'package:chat_app/widgets/auth_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(String email, String userName, String password,
      bool isLogin, BuildContext ctx) async {
    try {
      if (isLogin) {
        final UserCredential userCred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        final UserCredential userCred = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
      }
    } on PlatformException catch (err) {
      var message = "ERROR OCCURED. Please check $err";

      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
    } catch (err) {
      print(err);
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(err.toString()),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: AuthForm(_submitAuthForm),
          ),
        ),
      ),
    );
  }
}
