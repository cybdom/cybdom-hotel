import 'package:cybdom_hotel/global.dart';
import 'package:cybdom_hotel/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum AuthType { login, signup }

class AuthScreen extends StatelessWidget {
  final AuthType authType;

  const AuthScreen({Key key, this.authType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                heightFactor: .4,
                child: Image.network(
                  montain,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: .69,
                child: AuthForm(authType: authType),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({Key key, this.authType}) : super(key: key);
  final AuthType authType;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Text(
            authType == AuthType.login
                ? "Welcome Back"
                : "Create a new account",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 15),
          Form(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Username or Email",
                    filled: true,
                    fillColor: MyColors.lightBlue,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              Checkbox(
                value: false,
                onChanged: (bool value) {},
              ),
              SizedBox(
                width: 5,
              ),
              Text("Remember Me"),
            ],
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: MyButton(
              onTap: () => Navigator.pushReplacementNamed(context, 'home'),
              text: authType == AuthType.login ? "Login" : "Register",
            ),
          ),
          if (authType == AuthType.login)
            Center(
              child: FlatButton(
                child: Text("Forgot password?"),
                onPressed: () {},
              ),
            ),
          if (authType == AuthType.signup)
            Column(
              children: <Widget>[
                SizedBox(height: 25),
                Text(
                  "or Register with",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 9,
                            offset: Offset(0, 3),
                            color: Colors.black.withOpacity(.12),
                          ),
                        ],
                      ),
                      child: Icon(FontAwesomeIcons.google, color: Colors.redAccent),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 9,
                            offset: Offset(0, 3),
                            color: Colors.black.withOpacity(.12),
                          ),
                        ],
                      ),
                      child: Icon(FontAwesomeIcons.twitter, color: Colors.blueAccent),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 9,
                            offset: Offset(0, 3),
                            color: Colors.black.withOpacity(.12),
                          ),
                        ],
                      ),
                      child: Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  authType == AuthType.login
                      ? "Don't have an account?"
                      : "Already have an account?",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              FlatButton(
                child: Text(authType == AuthType.login ? "Register" : "Login"),
                onPressed: () {
                  if (authType == AuthType.login)
                    Navigator.pushReplacementNamed(context, "signup");
                  else
                    Navigator.pushReplacementNamed(context, "login");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
