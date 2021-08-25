// @dart=2.9

import 'package:flutter/material.dart';
import 'package:popol_club/providers/cart.dart';
import 'package:popol_club/providers/order.dart';
import 'package:popol_club/screens/land_page.dart';
import 'package:popol_club/screens/order_screen.dart';
import 'package:popol_club/style/color.dart';
import 'package:popol_club/widget/cart_tile.dart';
import 'package:popol_club/widget/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  // final Cart order;

  // CartScreen(this.order);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        NavBar.routeName,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Cart',
                    style: TextStyle(
                      color: AppColors.pink400,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.68,
              padding: EdgeInsets.all(12),
              child: cart.totalAmount != 0
                  ? CartView()
                  : Column(
                      children: <Widget>[
                        Container(
                          child: SvgPicture.asset(
                            'assets/images/cart.svg',
                            height: MediaQuery.of(context).size.height * 0.6,
                            alignment: Alignment.center,
                          ),
                        ),
                        Text(
                          'Cart is Empty',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.pink400,
                              fontSize: 20),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .85,
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.pink400,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent[400],
                        borderRadius: BorderRadius.circular(20)),
                    child: Orderbutton(cart: cart),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Orderbutton extends StatefulWidget {
  const Orderbutton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderbuttonState createState() => _OrderbuttonState();
}

class _OrderbuttonState extends State<Orderbutton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (widget.cart.totalAmount == 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              widget.cart.clear();
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => OrderScreen()));
            },
      child: _isLoading
          ? CircularProgressIndicator()
          : Text(
              'Place Order',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
    );
  }
}
