import 'package:flutter/material.dart';
import 'package:popol_club/providers/auth.dart';

import 'package:popol_club/screens/User_Product_screen.dart';
import 'package:popol_club/screens/order_screen.dart';
import 'package:popol_club/style/color.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height * .9,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _drawerHead(context),
              SizedBox(height: 10),
              _activities(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerHead(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 250,
          width: width,
          decoration: BoxDecoration(
            color: Colors.pinkAccent[400],
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 30,
                  right: -100,
                  child: _circularContainer(250, AppColors.pink300)),
              Positioned(
                  top: -100,
                  left: -45,
                  child: _circularContainer(width * .4, AppColors.pink400)),
              Positioned(
                  top: -180,
                  right: -30,
                  child: _circularContainer(width * .75, AppColors.pink700,
                      borderColor: Colors.white38)),
              Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _detail(
                        imagePath: 'assets/images/me.jpg',
                        name: 'Kazeem Ibrahim',
                        purpose: 'user',
                      ),
                    ],
                  ))
            ],
          )),
    );
  }

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget _detail({
    String imagePath = '',
    String name = '',
    String purpose = '',
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imagePath),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 5),
        Text(
          purpose,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _activities(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _act(
            Icons.person,
            TextButton(
              onPressed: () {},
              child: Text(
                'Who are we',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
          // SizedBox(height: 20),
          _act(
            Icons.shopping_cart,
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => OrderScreen()));
              },
              child: Text(
                'Order',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          // SizedBox(height: 20),
          _act(
            Icons.money,
            FlatButton(
              onPressed: () {},
              child: Text(
                'Coupon',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          // SizedBox(height: 20),
          _act(
            Icons.wallet_giftcard,
            FlatButton(
              onPressed: () {},
              child: Text(
                'Payment',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          // SizedBox(height: 20),

          _act(
            Icons.edit,
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => UserProductsScreen()));
              },
              child: Text(
                'Manage Products',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          _act(
            Icons.logout,
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');

                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
                Provider.of<Auth>(context, listen: false).logout();
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          // SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _act(IconData icon, Widget flatbutton) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.pink400),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                SizedBox(width: 10),
                flatbutton,
              ],
            ),
            Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
