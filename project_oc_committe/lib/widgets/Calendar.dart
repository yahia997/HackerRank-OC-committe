/**
 * 
 * This calendar is made using package called "TableCalendar 3.1.2"
 * We will add interactivity to add events and so on
 * We will add custom styles (green)
 */

import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';
import 'package:project_oc_committe/services/calendar.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarEvents>(builder: (context, value, child) {
      return TableCalendar(
        // to make range dynamic 5 years before current day and 5 years after it
        firstDay: DateTime.utc(DateTime.now().year - 5, 1, 1),
        lastDay: DateTime.utc(DateTime.now().year + 5, 12, 31),
        focusedDay: DateTime.now(),

        // to load events saved in provider, if there is no events will return empty list
        eventLoader: (day) {
          return value.events[day] ?? [];
        },

        // To customize UI and colors
        calendarBuilders: CalendarBuilders(
          // Customize current day (make background color green and shape as circle)
          todayBuilder: (context, day, focusedDay) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: mainGreen,
                shape: BoxShape.circle,
              ),
              child: Text(
                day.day.toString(), // to show number of the current day
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      );
    });
  }
}
