import 'package:flutter/cupertino.dart';

class ScreenProfileProvider with ChangeNotifier {
  void popPage(context) {
    Navigator.pop(context);
  }
}
