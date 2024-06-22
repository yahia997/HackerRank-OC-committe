import 'package:flutter/material.dart';
import 'package:project_oc_committe/modules/Event.dart';

class CalendarEvents extends ChangeNotifier {
  // We will initialize old events with API when it is ready
  Map<DateTime, List<Event>> events = {
    DateTime.utc(2024, 6, 20): [
      Event(
          description: "",
          location: "",
          startDate: DateTime.utc(2024, 6, 20),
          title: "title",
          endDate: DateTime.utc(2024, 6, 20))
    ],
  };

  // default selected day is the current day
  DateTime selectedDay = DateTime.now();

  // information about the event that will be added and used will change it
  TextEditingController eventDescription = TextEditingController();
  TextEditingController eventTitle = TextEditingController();
  TextEditingController eventLocation = TextEditingController();

  void addEvent(DateTime date, Event data) {
    // If we found that day before
    if (events.containsKey(date)) {
      events[date]?.add(data);
    } else {
      events[date] = [data];
    }
    notifyListeners();
  }
}
