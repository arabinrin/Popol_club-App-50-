import 'package:flutter/material.dart';
import 'package:popol_club/providers/auth.dart';
import 'package:popol_club/providers/cart.dart';
import 'package:popol_club/providers/chip_providers.dart';
import 'package:popol_club/providers/order.dart';
import 'package:popol_club/providers/product_blog.dart';
import 'package:popol_club/screens/blog_screen.dart';
import 'package:popol_club/screens/cart_screen.dart';
import 'package:popol_club/screens/User_Product_screen.dart';
import 'package:popol_club/screens/edit_blog_screen.dart';
import 'package:popol_club/screens/edit_product_screen.dart';
import 'package:popol_club/screens/land_page.dart';
import 'package:popol_club/screens/order_screen.dart';
import 'package:popol_club/screens/signin_screen.dart';
import 'package:popol_club/screens/user_profile.dart';
import 'package:popol_club/widget/nav_bar.dart';
import '../providers/products.dart';
import './screens/splash_screen.dart';
import './screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products([]),
          update: (ctx, auth, previousProducts) => Products(
            previousProducts == null ? [] : previousProducts.items,
            auth.token,
            auth.userId,
          ),
        ),
        ChangeNotifierProvider(create: (ctx) => ChipProducts()),
        ChangeNotifierProvider(create: (ctx) => ProductBlogs()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders([]),
          update: (ctx, auth, previousOrders) => Orders(
            previousOrders == null ? [] : previousOrders.orders,
            auth.token,
            auth.userId,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Popol',
          home: auth.isAuth
              ? NavBar()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : SignIn(),
                ),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Color(0xFF761322),
          ),
          routes: {
            SplashScreen.routeName: (ctx) => SplashScreen(),
            NavBar.routeName: (ctx) => NavBar(),
            LandingPage.routeName: (ctx) => LandingPage(),

            BlogScreen.routeName: (ctx) => BlogScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrderScreen.routeName: (ctx) => OrderScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditBlogScreen.routeName: (ctx) => EditBlogScreen(),
            UserProfile.routeName: (ctx) => UserProfile(),

            //   //GRID_ITEM_DETAILS_SCREEN: (BuildContext context) => GridItemDetails(),
          },
        ),
      ),
    );
  }
}
