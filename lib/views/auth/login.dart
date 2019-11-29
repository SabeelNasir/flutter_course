import 'package:flutter/material.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginLayout('Flutter Login'),
    );
  }
}

class LoginLayout extends StatefulWidget {
  final String title;
  LoginLayout(this.title);
  @override
  State<StatefulWidget> createState() {
    return LoginLayoutState();
  }
}

class LoginLayoutState extends State<LoginLayout> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      style: style,
      obscureText: false,
      decoration: InputDecoration(
          hintText: 'Username',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      style: style,
      obscureText: false,
      decoration: InputDecoration(
          hintText: 'Password',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(36),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.freepik.com/free-psd/medical-mock-up-with-doctor-working-with-tablet_23-2147659934.jpg"),
                          ),
                        ),
                      ),
                      Text(
                        'Notex Doctors',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(height: 35.0),
                      usernameField,
                      SizedBox(height: 35.0),
                      passwordField,
                      SizedBox(
                        height: 30.0,
                      ),
                      loginButton
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
