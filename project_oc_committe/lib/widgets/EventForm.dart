import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  title: const Text('Add Event'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: [
                          // Title text input
                          TextFormField(
                            controller: value.eventTitle,
                            decoration: const InputDecoration(
                              labelText: 'Title',
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                    controller: value.fromHours,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      // for below version 2 use this
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      // for version 2 and greater youcan also use this
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      labelText: "Hours start",
                                      hintText: "Hours start",
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                    controller: value.fromM,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      // for below version 2 use this
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      // for version 2 and greater youcan also use this
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      labelText: "Minutes start",
                                      hintText: "Minutes start",
                                    )),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                    controller: value.fromHours,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      // for below version 2 use this
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      // for version 2 and greater youcan also use this
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      labelText: "Hours end",
                                      hintText: "Hours end",
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                    controller: value.fromM,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      // for below version 2 use this
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      // for version 2 and greater youcan also use this
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      labelText: "Minutes end",
                                      hintText: "Minutes end",
                                    )),
                              )
                            ],
                          ),

                          // Location text input
                          TextFormField(
                            controller: value.eventLocation,
                            decoration: const InputDecoration(
                              labelText: 'Location',
                            ),
                          ),

                          // Description text input
                          TextFormField(
                            controller: value.eventDescription,
                            decoration: const InputDecoration(
                              labelText: 'Description',
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
                            child: const Text("Discard"),
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
                                    startDate: value
                                        .selectedDay, // will be changed by input later
                                    endDate:
                                        curr, // will be changed by input later
                                    title: value.eventTitle.text);
                                value.addEvent(
                                    DateTime.utc(
                                        value.selectedDay.year,
                                        value.selectedDay.month,
                                        value.selectedDay.day),
                                    obj);

                                // to reset input fields
                                value.eventTitle.text = "";
                                value.eventDescription.text = "";
                                value.eventLocation.text = "";
                                value.fromHours.text = "";
                                value.fromM.text = "";
                                value.toHours.text = "";
                                value.toM.text = "";

                                // shows message to user
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Event added Successfully")));
                              } catch (err) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Some Thing went wrong")));
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
