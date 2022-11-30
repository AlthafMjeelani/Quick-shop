import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenStepperProvider with ChangeNotifier {
   StepperType stepperType = StepperType.horizontal;
  int currentStep = 0;
  tapped(int step) {
    currentStep = step;
    notifyListeners();
  }

  continued() {
    currentStep < 2 ? currentStep += 1 : null;
    notifyListeners();
  }

  cancel() {
    currentStep > 0 ? currentStep -= 1 : null;
    notifyListeners();
  }
  void pop(){
    Get.back();
  }
}
