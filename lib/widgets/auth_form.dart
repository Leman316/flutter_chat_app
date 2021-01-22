import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitfn, this.isLoading);
  final void Function(String email, String userName, String password,
      bool isLogin, BuildContext ctx) submitfn;
  final bool isLoading;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();

  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPass = '';
  void _trysubmit() {
    final isValid = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formkey.currentState.save();
      //  print(_userEmail);
      // print(_userName);
      //  print(_userPass);
      widget.submitfn(_userEmail.trim(), _userName.trim(), _userPass.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              key: ValueKey('Email'),
              validator: (value) {
                if (value.isEmpty || !value.contains('@'))
                  return 'Enter a valid Email Address.';
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Enter Email",
              ),
              onSaved: (newValue) {
                _userEmail = newValue;
              },
            ),
            if (!_isLogin)
              TextFormField(
                  key: ValueKey('Username'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 4)
                      return 'Short username';
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'UserName'),
                  onSaved: (newValue) {
                    _userName = newValue;
                  }),
            TextFormField(
                key: ValueKey('Password'),
                validator: (value) {
                  if (value.isEmpty || value.length < 7)
                    return 'Password must be at least 7 character long';
                  return null;
                },
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (newValue) {
                  _userPass = newValue;
                }),
            SizedBox(
              height: 12,
            ),
            if (widget.isLoading) CircularProgressIndicator(),
            if (!widget.isLoading)
              RaisedButton(
                child: _isLogin ? Text('Login') : Text('Signup'),
                onPressed: _trysubmit,
              ),
            if (!widget.isLoading)
              FlatButton(
                child: _isLogin
                    ? Text('Create new Account')
                    : Text('Already Have a Account'),
                textColor: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
              )
          ],
        ),
      ),
    );
  }
}
