import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Enter Email",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'UserName'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(
              height: 12,
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Create new Account'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
