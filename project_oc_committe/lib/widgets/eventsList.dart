import 'package:flutter/material.dart';
import 'package:project_oc_committe/services/calendar.dart';
import 'package:provider/provider.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarEvents>(
      builder: (context, value, child) {
        return Column(
          children: value.events.entries.map((e) => Text(e.value[0].title)).toList(),
        );
      },
    );
  }
}
