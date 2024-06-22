import 'package:flutter/material.dart';
import 'package:project_oc_committe/modules/Event.dart';
import 'package:project_oc_committe/services/calendar.dart';
import 'package:provider/provider.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarEvents>(
      builder: (context, value, _) {
        return FloatingActionButton(
          child: const Text('Add Event'),
          onPressed: () {
            // You can use `ref` here.
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text('Add Event'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: [
                          // Title text input
                          TextFormField(
                            controller: value.eventTitle,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              icon: Icon(Icons.account_box),
                            ),
                          ),

                          // Location text input
                          TextFormField(
                            controller: value.eventLocation,
                            decoration: InputDecoration(
                              labelText: 'Location',
                              icon: Icon(Icons.message),
                            ),
                          ),

                          // Description text input
                          TextFormField(
                            controller: value.eventDescription,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              icon: Icon(Icons.email),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                        child: Text("Discard"),
                        onPressed: () {

                          // to close the popup form
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        }),
                        ElevatedButton(
                        child: const Text("Create"),
                        onPressed: () {
                          try {
                            DateTime curr = DateTime.now();

                            // create event object
                            Event obj = Event(
                                description: value.eventDescription.text,
                                location: value.eventLocation.text,
                                startDate: value.selectedDay, // will be changed by input later
                                endDate: curr, // will be changed by input later
                                title: value.eventTitle.text);
                            value.addEvent(
                                DateTime.utc(value.selectedDay.year,
                                    value.selectedDay.month, value.selectedDay.day),
                                obj);

                            // shows message to user
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Event added Successfully")));
                          } catch (err) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Some Thing went wrong")));
                          }

                          // to close the popup form
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        }),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
