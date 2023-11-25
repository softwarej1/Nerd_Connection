import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:flutter_getx_palette_diary/src/widget/home_calendar.dart';
import 'package:flutter_getx_palette_diary/src/widget/home_fab.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'PALETTE',
            style: TextStyle(
              fontFamily: 'NanumGothic',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: _body(),
        floatingActionButton: HomeFab(onPressed: controller.handleFabPress),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _calendalWidget(),
        if (controller.isDateSelected.value) _cardWidget(),
      ],
    );
  }

  Widget _calendalWidget() {
    return SizedBox(
      key: controller.calendarKey,
      height: 350,
      child: HomeCalendar(
        focusMonth: controller.headerDate.value,
        onCalendarCreated: controller.onCalendarCreated,
        onCalendarDaySelected: (selectedDay) {
          controller.updateSelectedDay(selectedDay);
        },
      ),
    );
  }

  Widget _cardWidget() {
    DateTime? selectedDate = controller.selectedDay.value;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: controller.isDateSelected.value ? 220 : 0,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Selected Date: ${selectedDate?.toLocal()}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
