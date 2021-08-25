// // @dart=2.9

// import 'package:flutter/material.dart';
// import 'package:popol_club/screens/land_page.dart';
// import 'package:popol_club/screens/signin_screen.dart';
// import 'package:popol_club/widget/Nav_bar.dart';
// import '../style/color.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

// // class to draw the profile screen
// class Login extends StatefulWidget {
//   static const routeName = '/login';

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool _passwordVisible = false;
//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   String validatePassword(String value) {
//     if (value.isEmpty) {
//       return "* Required";
//     } else if (value.length < 6) {
//       return "Password should be atleast 6 characters";
//     } else if (value.length > 15) {
//       return "Password should not be greater than 15 characters";
//     } else
//       return ' ';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xFFFFE3E3),
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Colors.pinkAccent[400],
//           leading: Icon(
//             Icons.menu,
//             color: Colors.white,
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               CustomPaint(
//                 child: Container(
//                   alignment: Alignment.topCenter,
//                   child: Column(
//                     children: [
//                       Text(
//                         'SIGN IN',
//                         style: TextStyle(
//                           fontSize: 32.0,
//                           letterSpacing: 1.5,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         'Sign In to access your',
//                         style: TextStyle(
//                           fontSize: 13.0,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         'App',
//                         style: TextStyle(
//                           fontSize: 13.0,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                 ),
//                 painter: HeaderCurvedContainer(),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                   ),
//                 ],
//               ),
//               SingleChildScrollView(
//                 child: Form(
//                   autovalidate: true, //check for validation while typing
//                   key: formkey,
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(height: 100),
//                       Container(
//                         height: 45,
//                         width: 350,
//                         padding: EdgeInsets.only(
//                           left: 10,
//                           right: 10,
//                           top: 1,
//                           bottom: 5,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white,
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                               hintText: "Email",
//                               fillColor: Colors.white,
//                               icon: Icon(
//                                 Icons.person,
//                                 color: Colors.pinkAccent[400],
//                               ),
//                               border: InputBorder.none,
//                             ),
//                             validator: MultiValidator(
//                               [
//                                 RequiredValidator(errorText: "* Required"),
//                                 EmailValidator(
//                                     errorText: "Enter valid email id"),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       Container(
//                         height: 45,
//                         width: 350,
//                         padding: EdgeInsets.only(
//                           left: 10,
//                           right: 10,
//                           top: 1,
//                           bottom: 5,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 15.0, right: 15.0, top: 15, bottom: 0),
//                           child: TextFormField(
//                               obscureText: !_passwordVisible ? true : false,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.white,
//                                 hintText: "Password",
//                                 icon: Icon(
//                                   Icons.lock,
//                                   color: Colors.pinkAccent[400],
//                                 ),
//                                 suffixIcon: IconButton(
//                                     icon: Icon(
//                                       // Based on passwordVisible state choose the icon
//                                       _passwordVisible
//                                           ? Icons.visibility
//                                           : Icons.visibility_off,
//                                       color: Color(0xFFD81B60),
//                                     ),
//                                     onPressed: () {
//                                       // Update the state i.e. toogle the state of passwordVisible variable
//                                       setState(() {
//                                         _passwordVisible = !_passwordVisible;
//                                       });
//                                     }),
//                                 border: InputBorder.none,
//                               ),
//                               validator: MultiValidator([
//                                 RequiredValidator(errorText: "* Required"),
//                                 MinLengthValidator(6,
//                                     errorText:
//                                         "Password should be atleast 6 characters"),
//                                 MaxLengthValidator(15,
//                                     errorText:
//                                         "Password should not be greater than 15 characters")
//                               ])
//                               //validatePassword,        //Function to check validation
//                               ),
//                         ),
//                       ),
//                       Container(
//                         width: 350,
//                         alignment: Alignment.topRight,
//                         child: FlatButton(
//                           onPressed: () {
//                             //TODO FORGOT PASSWORD SCREEN GOES HERE
//                           },
//                           child: Text(
//                             'Forgot Password',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 13,
//                             ),
//                             textAlign: TextAlign.right,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 50),
//                       Container(
//                         height: 40,
//                         width: 250,
//                         decoration: BoxDecoration(
//                             color: Colors.pinkAccent[400],
//                             borderRadius: BorderRadius.circular(20)),
//                         child: FlatButton(
//                           onPressed: () {
//                             if (formkey.currentState.validate()) {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (_) => NavBar()));
//                               print("Validated");
//                             } else {
//                               print("Not Validated");
//                             }
//                           },
//                           child: Text(
//                             'Login',
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 50),
//                       Container(
//                         height: 40,
//                         width: 300,
//                         decoration: BoxDecoration(
//                             color: Colors.pinkAccent[400],
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 5, right: 5, top: 5, bottom: 5),
//                               child: Icon(
//                                 FontAwesomeIcons.facebook,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             FlatButton(
//                               onPressed: () {},
//                               child: Text(
//                                 'Sign in with Facebook',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Container(
//                         height: 40,
//                         width: 300,
//                         decoration: BoxDecoration(
//                             color: Colors.pinkAccent[400],
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 5, right: 5, top: 5, bottom: 5),
//                               child: Icon(
//                                 FontAwesomeIcons.google,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             FlatButton(
//                               onPressed: () {},
//                               child: Text(
//                                 'Sign in with Google',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 80),
//                       Container(
//                         width: 350,
//                         alignment: Alignment.center,
//                         child: FlatButton(
//                           onPressed: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (_) => SignIn()));
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Don’t have an account? ',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 13,
//                                 ),
//                                 textAlign: TextAlign.right,
//                               ),
//                               Text(
//                                 ' SIGN UP',
//                                 style: TextStyle(
//                                   color: Colors.pinkAccent[400],
//                                   fontSize: 15,
//                                 ),
//                                 textAlign: TextAlign.right,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // CustomPainter class to for the header curved-container
// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = const Color(0xfff50057);
//     Path path = Path()
//       ..relativeLineTo(0, 160)
//       ..quadraticBezierTo(size.width / 4, 80.0, size.width, 160)
//       ..relativeLineTo(0, -160)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
