import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<DateTime> selectedDay = Rx(DateTime.now());
  Rx<DateTime> focusedDay = Rx(DateTime.now());

  void updateSelectedDay(DateTime newSelectedDay) {
    selectedDay.value = newSelectedDay;
  }

  void updateFocusedDay(DateTime newFocusedDay) {
    focusedDay.value = newFocusedDay;
  }
}
