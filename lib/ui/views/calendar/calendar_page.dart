import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/resources/values_manager.dart';
import 'package:todo_bloc/ui/views/calendar/widgets/horizontal_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        '${DateFormat.EEEE().format(now)}, ${DateFormat.d().format(now)}';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 0,
        title: Text(
          formattedDate,
          style: getHeaderStyle(fontSize: AppSize.s20, color: AppColors.black),
        ),
      ),
      body: Column(
        children: [
          HorizontalCalendar(),
        ],
      ),
    );
  }
}
