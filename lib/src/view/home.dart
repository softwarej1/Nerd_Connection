import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:flutter_getx_palette_diary/src/widget/home_calendar.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _body()),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _calendalWidget(),
      ],
    );
  }

  Widget _calendalWidget() {
    return SizedBox(
      key: controller.calendarKey,
      height: 400,
      child: HomeCalendar(
        focusMonth: controller.headerDate.value,
        onCalendarCreated: controller.onCalendarCreated,
      ),
    );
  }
}
