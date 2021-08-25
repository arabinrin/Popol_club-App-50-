// @dart=2.9
import 'package:flutter/material.dart';
import 'package:popol_club/models/http_exception.dart';
import 'package:popol_club/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class to draw the profile screen
enum AuthMode { signup, Login }

class SignIn extends StatefulWidget {
  static const routeName = '/signIn';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  bool _passwordVisible = true;
  GlobalKey<FormState> _formkey = GlobalKey();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    // if (!_formkey.currentState.validate()) {
    //   // Invalid!
    //   return;
    // }
    _formkey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['email'],
          _authData['password'],
        );
      }
      Navigator.of(context).restorablePushReplacementNamed('/nav');
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFE3E3),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.pinkAccent[400],
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP',
                        style: TextStyle(
                          fontSize: 32.0,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _authMode == AuthMode.Login
                            ? 'or sign up to App, Create a'
                            : 'Alredy signed up?',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        _authMode == AuthMode.Login
                            ? 'Free account'
                            : 'Then fucking login',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                painter: HeaderCurvedContainer(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Form(
                  autovalidate: true, //check for validation while typing
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      Container(
                        height: 45,
                        width: 350,
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 1,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              fillColor: Colors.white,
                              icon: Icon(
                                Icons.person,
                                color: Colors.pinkAccent[400],
                              ),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return '';
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 45,
                        width: 350,
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 1,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFormField(
                            focusNode: _emailFocusNode,
                            obscureText: _passwordVisible,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: _passwordVisible
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                              fillColor: Colors.white,
                              labelText: "Password",
                              icon: Icon(
                                Icons.lock,
                                color: Colors.pinkAccent[400],
                              ),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty || value.length < 5) {
                                return 'Password is too short!';
                              }
                              return '';
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      if (_authMode == AuthMode.signup)
                        Container(
                          height: 45,
                          width: 350,
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 1,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              obscureText: _passwordVisible,
                              focusNode: _passwordFocusNode,
                              decoration: InputDecoration(
                                suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    icon: _passwordVisible
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility)),
                                fillColor: Colors.white,
                                labelText: "Password",
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.pinkAccent[400],
                                ),
                                border: InputBorder.none,
                              ),
                              validator: _authMode == AuthMode.signup
                                  ? (value) {
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match!';
                                      } else {
                                        return null;
                                      }
                                    }
                                  : null,
                            ),
                          ),
                        ),
                      SizedBox(height: 50),
                      if (_isLoading)
                        CircularProgressIndicator()
                      else
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent[400],
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: _submit,
                            child: Text(
                              _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      SizedBox(height: 80),
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              child: Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.white,
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                _authMode == AuthMode.Login
                                    ? 'Log in with Facebook'
                                    : 'Sign up with Facebook',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              child: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                _authMode == AuthMode.Login
                                    ? 'Sign in with Google'
                                    : 'Sign up with Google',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: 350,
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: _switchAuthMode,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _authMode == AuthMode.Login
                                    ? 'Don\'t have an account? '
                                    : 'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                _authMode == AuthMode.Login
                                    ? ' SIGN UP'
                                    : ' LOG IN',
                                style: TextStyle(
                                  color: Colors.pinkAccent[400],
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// CustomPainter class to for the header curved-container
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xfff50057);
    Path path = Path()
      ..relativeLineTo(0, 160)
      ..quadraticBezierTo(size.width / 4, 80.0, size.width, 160)
      ..relativeLineTo(0, -160)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
