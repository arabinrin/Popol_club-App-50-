import 'package:flutter/material.dart';
import 'package:popol_club/providers/products.dart';
import 'package:popol_club/screens/cart_screen.dart';
import 'package:popol_club/widget/clip_tiles.dart';
import 'package:popol_club/widget/card_tile.dart';
import 'package:popol_club/style/color.dart';
import 'package:popol_club/widget/special_card.dart';
import 'package:popol_club/widget/special_card_tile.dart';
import 'package:provider/provider.dart';
import './drawer_screen.dart';

class LandingPage extends StatefulWidget {
  static const routeName = '/landing';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isPrimaryCard = true;
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fetchProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: DrawerScreen(),
      backgroundColor: Color(0xFFFFE3E3),
      body: Container(
        child: Column(
          children: <Widget>[
            _header(context),
            SizedBox(height: 10),
            _rowclip(),
            SizedBox(height: 10),
            _categoryRow("Special Product"),
            _featuredRowA(),
            _categoryRowB("Featured Product", 'ViewAll'),
            SizedBox(height: 10),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : _featuredColumn(),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          height: 240,
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
                  child: _circularContainer(300, AppColors.pink300)),
              Positioned(
                  top: -100,
                  left: -45,
                  child: _circularContainer(width * .5, AppColors.pink400)),
              Positioned(
                  top: -180,
                  right: -30,
                  child: _circularContainer(width * .7, AppColors.pink700,
                      borderColor: Colors.white38)),
              Positioned(
                  top: 40,
                  left: 0,
                  child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  _scaffoldState.currentState?.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 7),
                              Text(
                                "Popol Club",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              SizedBox(width: 120),
                              Icon(
                                Icons.notification_add_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CartScreen()));
                                },
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 100),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: 40,
                                width: 300,
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 1,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search...",
                                    icon: Icon(
                                      Icons.search_rounded,
                                      color: Colors.pinkAccent[400],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                )),
                          )
                        ],
                      )))
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

  Widget _categoryRow(
    String title,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _categoryRowB(
    String title,
    String work,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50)),
              color: AppColors.pink400,
            ),
            child: Text(
              work,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  Widget _featuredRowA() {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFFFE3E3)),
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: SpecialListview(),
    );
  }

  Widget _featuredColumn() {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFFFE3E3)),
      height: 245,
      padding: EdgeInsets.all(15),
      child: Listview(),
    );
  }

  Widget _rowclip() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      alignment: Alignment.center,
      height: 40,
      child: Clipview(),
    );
  }
}
