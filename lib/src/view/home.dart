import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _body()),
    );
  }

  Widget _body() {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: controller.focusedDay.value,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      daysOfWeekHeight: 30,
      headerStyle: HeaderStyle(
        titleTextFormatter: (date, locale) =>
            DateFormat.yMMM(locale).format(date),
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleCentered: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 19.0,
          color: Colors.black,
        ),
        headerPadding: const EdgeInsets.all(8.0),
      ),
      calendarBuilders: CalendarBuilders(
        // ignore: body_might_complete_normally_nullable
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday) {
            return const Center(
              child: Text(
                '일',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (day.weekday == DateTime.saturday) {
            return const Center(
              child: Text(
                '토',
                style: TextStyle(color: Colors.blue),
              ),
            );
          }
        },
      ),
      onDaySelected: (selectedDay, focusedDay) {
        controller.updateSelectedDay(selectedDay);
        controller.updateFocusedDay(focusedDay);
      },
      selectedDayPredicate: (DateTime day) {
        return isSameDay(controller.selectedDay.value, day);
      },
    );
  }
}
