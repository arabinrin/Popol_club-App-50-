// @dart=2.9
import 'package:flutter/material.dart';
import 'package:popol_club/providers/order.dart';
import 'package:popol_club/style/color.dart';
import 'package:popol_club/widget/order.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/order';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _nameFocusNode = FocusNode();

  final TextEditingController _nameController = TextEditingController();

  _submitForm() {
    if (_formKey.currentState.validate()) {
      final user = {
        'name': _nameController.text,
      };
    }
  }

  String _validateInput(String value) {
    if (value.trim().isEmpty) {
      return 'Field required';
    }
    return '';
  }

  _nextFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Container(
            alignment: Alignment.topLeft,
            height: 50,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20),
            ),
          ),
          Container(
            height: 150,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 130,
                        height: 70,
                        child: Image.asset('assets/images/love.png'),
                      ),
                      SizedBox(height: 10),
                      Text('Popol club',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.pink400)),
                      Text('Le partenaire de votre',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.pink400)),
                      Text('plaisir securitaire',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.pink400)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: <Widget>[
                Text('Enter Tracking Number to track',
                    style: TextStyle(fontSize: 20)),
                Text('your Package', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.pink400),
                      ),
                      child: TextFormField(
                        focusNode: _nameFocusNode,
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: _validateInput,
                        onFieldSubmitted: (String value) {
                          _nextFocus(_nameFocusNode);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your tracking Number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .72,
                          decoration: BoxDecoration(
                            color: AppColors.pink400,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FlatButton(
                            onPressed: _submitForm,
                            child: Text('Track My Package'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Checkout last Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(),
            child: orderData.orders.length != 0
                ? ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (ctx, i) => OrderTile(orderData.orders[i]),
                  )
                : Column(
                    children: <Widget>[
                      Container(
                        child: SvgPicture.asset(
                          'assets/images/Empty-bro.svg',
                          height: MediaQuery.of(context).size.height * 0.25,
                          alignment: Alignment.center,
                        ),
                      ),
                      Text(
                        'No Order Yet',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.pink400,
                            fontSize: 20),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
