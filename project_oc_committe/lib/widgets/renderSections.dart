// Yahya Mahmoud
// To render different secions (material, tasks, events, members)

import 'package:flutter/material.dart';
import 'package:project_oc_committe/screens/events.dart';
import 'package:project_oc_committe/screens/materials.dart';
import 'package:project_oc_committe/screens/members.dart';
import 'package:project_oc_committe/screens/tasks.dart';
import 'package:project_oc_committe/services/toggleSections.dart';
import 'package:provider/provider.dart';

class RenderSection extends StatelessWidget {
  const RenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<toggleSections>(builder: (context, value, child) {
      switch (value.activeSection) {
        case "Materials":
          return const Materials();
        case "Tasks":
          return const Tasks();
        case "Events":
          return const Events();
        case "Members":
          return const Members();
        default:
          return const Text("Loading...");
      }
    });
  }
}
