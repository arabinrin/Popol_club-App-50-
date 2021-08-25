import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String type;
  final String imageUrl;
  bool order;
  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.type,
    @required this.imageUrl,
    this.order = false,
  });
}
