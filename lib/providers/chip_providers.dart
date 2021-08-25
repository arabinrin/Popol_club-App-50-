import 'package:flutter/cupertino.dart';
import 'package:popol_club/models/chip_list.dart';

class ChipProducts with ChangeNotifier {
  List<ChipProvider> _lists = [
    ChipProvider(text: 'Health', height: 0),
    ChipProvider(text: 'food', height: 0),
    ChipProvider(text: 'Utilities', height: 0),
    ChipProvider(text: 'Home', height: 0),
    ChipProvider(text: 'Health', height: 0),
    ChipProvider(text: 'Health', height: 0),
  ];
  List<ChipProvider> get lists {
    return [..._lists];
  }
}
