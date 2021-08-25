import 'package:flutter/material.dart';
import 'package:popol_club/screens/land_page.dart';
import 'package:popol_club/style/color.dart';
import 'package:popol_club/widget/Nav_bar.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user-profile';
  final String userId;
  final String name;
  final String purpose;
  final String address;
  final String phone;
  final String imageUrl;
  UserProfile({
    this.userId: 'id1',
    this.name: 'Kazeem Ibrahim',
    this.purpose: 'Supposed Builder',
    this.address: '2660-6B Razabad Shahshams Road Multan,Pakistan',
    this.phone: '09027893102',
    this.imageUrl: 'assets/images/me.jpg',
  });

  @override
  Widget build(BuildContext context) {
    String track = phone.substring(1, 5);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    ),
                  ),
                  Text(
                    'User Profile',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        NavBar.routeName,
                      );
                    },
                    icon: Icon(
                      Icons.create,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.pink400, width: 4),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(imageUrl),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  purpose,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Phone Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(track + '******'),
                    ],
                  ),
                  SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(address),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('*******'),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent[400],
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    LandingPage.routeName,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Save Settings',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
