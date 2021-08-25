import 'package:flutter/foundation.dart';

class ChipProvider with ChangeNotifier {
  bool isPrimaryCard;
  final String text;
  double height;
  ChipProvider({
    this.isPrimaryCard = true,
    @required this.text,
    @required this.height,
  });
  void toggleFavoriteStatus() {
    isPrimaryCard = !isPrimaryCard;
    notifyListeners();
  }
}
