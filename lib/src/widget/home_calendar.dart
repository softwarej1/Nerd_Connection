import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/utils/data_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendar extends StatefulWidget {
  final Function(PageController) onCalendarCreated;
  final DateTime focusMonth;
  const HomeCalendar({
    Key? key,
    required this.focusMonth,
    required this.onCalendarCreated,
  }) : super(key: key);

  @override
  State<HomeCalendar> createState() => _HomeCalendarState();
}

class _HomeCalendarState extends State<HomeCalendar> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(HomeCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerVisible: true,
      headerStyle: customHeaderStyle,
      locale: 'ko_KR',
      firstDay: DateTime(DateTime.now().year, 1, 1),
      lastDay: DateTime(DateTime.now().year + 2, 1, 1),
      focusedDay: _focusedDay ?? DateTime.now(),
      calendarFormat: CalendarFormat.month,
      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Color(0xFF4DA9FF),
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, date) {
          return _dowHeaderStyle(
            date: TodoDataUtils.convertWeekdayToStringValue(date.weekday),
            color: TodoDataUtils.dayToColor(date),
          );
        },
        defaultBuilder: (context, date, _) => _dayStyle(
          date: date,
          color: TodoDataUtils.dayToColor(date),
          isToday: false,
        ),
        outsideBuilder: (context, date, _) => _dayStyle(
          date: date,
          color: TodoDataUtils.dayToColor(date, opacity: 0.3),
        ),
      ),
      onCalendarCreated: widget.onCalendarCreated,
      onFormatChanged: (format) {},
    );
  }

  void update() => setState(() {});

  Widget _dowHeaderStyle({required String date, required Color color}) {
    return Center(
      child: SizedBox(
        height: 30,
        child: Text(
          date,
          style: GoogleFonts.notoSans(color: color, fontSize: 13),
        ),
      ),
    );
  }

  HeaderStyle customHeaderStyle = const HeaderStyle(
    formatButtonVisible: false,
    titleCentered: true,
  );

  Widget _dayStyle({
    required DateTime date,
    Color? color,
    bool isToday = false,
    bool isSelected = false,
  }) {
    var backgroundColor = Colors.white;
    if (isToday) backgroundColor = const Color(0xffbebfc7);
    if (isSelected) backgroundColor = const Color(0xff4a69ea);
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Text(
              '${date.day}',
              style: GoogleFonts.notoSans(
                  color: isToday ? Colors.white : color, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
