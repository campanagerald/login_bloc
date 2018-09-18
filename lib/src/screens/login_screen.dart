import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../providers/provider.dart';
import '../models/login_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bloc bloc = Provider.of(context);

    return new Container(
        margin: EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: bloc.login,
          builder: (context, AsyncSnapshot<LoginModel> snapshot) {
            return Column(
              children: <Widget>[
                emailField(bloc, snapshot),
                passwordField(bloc, snapshot),
                Container(
                  margin: EdgeInsets.only(
                    top: 25.0,
                  ),
                ),
                // submitButton()
              ],
            );
          },
        ));
  }

  Widget emailField(Bloc bloc, AsyncSnapshot<LoginModel> snapshot) {
    Map<String, String> error = snapshot.error;

    return TextField(
      onChanged: (value) {
        bloc.onChangeLoginModel(email: value);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email Address',
        errorText: snapshot.hasError ? error["email"] : null,
      ),
    );
  }

  Widget passwordField(Bloc bloc, AsyncSnapshot<LoginModel> snapshot) {
    Map<String, String> error = snapshot.error;

    return TextField(
      onChanged: (value) {
        bloc.onChangeLoginModel(password: value);
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: '****',
        labelText: 'Password',
        errorText: snapshot.hasError ? error["email"] : null,
      ),
    );
  }

  // Widget submitButton() {
  //   return ScopedModelDescendant<LoginModel>(
  //     builder: (BuildContext context, Widget child, LoginModel model) {
  //       return RaisedButton(
  //         child: Text('Submit'),
  //         onPressed: () {},
  //       );
  //     },
  //   );
  // }
}
