import 'package:flutter/material.dart';
import 'package:project_oc_committe/modules/Event.dart';
import 'package:project_oc_committe/services/calendar.dart';
import 'package:project_oc_committe/widgets/Calendar.dart';
import 'package:project_oc_committe/widgets/eventsList.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalendarEvents()),
      ],
      child: Consumer<CalendarEvents>(
        builder: (context, value, child) {
          return Expanded(
            //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // to make width 100% of the screen
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    // main calendar
                    Calendar(),

                    // shows comming events
                    EventsList(),

                    // just for test
                    TextFormField(
                      controller: value.eventDescription,
                      decoration: const InputDecoration(
                        hintText: 'What will you do in this event?',
                        labelText: 'titl',
                      ),
                    ),
                    // style will be changed later
                    FloatingActionButton(
                      onPressed: () {
                        try {
                          DateTime curr = DateTime.now();

                          // create event object
                          Event obj = Event(
                            description: value.eventDescription.text,
                            location: value.eventLocation.text,
                            startDate: curr, // will be changed by input later
                            endDate: curr, // will be changed by input later
                            title: value.eventTitle.text
                          );
                          value.addEvent(
                              DateTime.utc(obj.startDate.year, obj.startDate.month, obj.startDate.day),
                              obj);

                          // shows message to user
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Event added Successfully")));
                        } catch (err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Some Thing went wrong")));
                        }
                      },
                      child: Text("Add Event"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
