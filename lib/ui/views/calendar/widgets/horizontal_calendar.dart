import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/resources/values_manager.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({super.key});

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  // late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2010, 10, 20),
      lastDay: DateTime.utc(2040, 10, 20),
      headerVisible: true,
      daysOfWeekVisible: true,
      sixWeekMonthsEnforced: true,
      shouldFillViewport: false,
      rowHeight: AppSize.s60,
      calendarFormat: _calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextStyle:
            getHeaderStyle(fontSize: AppSize.s18, color: AppColors.primaryNavy),
        leftChevronIcon: Icon(
          Icons.arrow_back_ios_outlined,
          color: AppColors.primaryNavy,
          size: AppSize.s20,
        ),
        rightChevronIcon: Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColors.primaryNavy,
          size: AppSize.s20,
        ),
        formatButtonTextStyle: getBodyStyle(color: AppColors.primaryNavy),
        formatButtonDecoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryNavy),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
      daysOfWeekHeight: AppSize.s30,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle:
            getBodyStyle(fontSize: AppSize.s16, color: AppColors.black),
        weekendStyle:
            getBodyStyle(fontSize: AppSize.s16, color: AppColors.accentRed),
      ),
      calendarStyle: CalendarStyle(
        tablePadding:
            const EdgeInsets.only(left: AppSize.s10, right: AppSize.s10),
        weekendTextStyle:
            getBodyStyle(color: AppColors.accentRed, fontSize: AppSize.s16),
        weekendDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(AppSize.s10)),
        isTodayHighlighted: true,
        todayTextStyle:
            getBodyStyle(color: AppColors.primaryNavy, fontSize: AppSize.s16),
        todayDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: AppColors.primaryNavy),
            borderRadius: BorderRadius.circular(AppSize.s10)),
        selectedTextStyle:
            getBodyStyle(color: AppColors.white, fontSize: AppSize.s16),
        selectedDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.primaryNavy,
            borderRadius: BorderRadius.circular(AppSize.s10)),
        canMarkersOverflow: true,
        defaultTextStyle:
            getBodyStyle(color: AppColors.black, fontSize: AppSize.s16),
        defaultDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(AppSize.s10)),
      ),
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
