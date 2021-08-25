import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  final String userId;
  final String name;
  final String purpose;
  final String address;
  final String phone;
  final String imageUrl;
  User({
    @required this.userId,
    @required this.name,
    @required this.purpose,
    @required this.address,
    @required this.phone,
    @required this.imageUrl,
  });
}
