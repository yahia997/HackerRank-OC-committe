// Yahya Mahmoud

/*
  We will get materials by API when it is ready
*/

import 'package:flutter/material.dart';
import 'package:project_oc_committe/widgets/MaterialBox.dart';

class Materials extends StatelessWidget {
  const Materials({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded( //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, // to make width 100% of the screen
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              
                // We will get materials by API when it is ready to loop through it

                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
                MaterialBox(id: 1, title: "material 1", date: "24/6/2024",),
              ],
          ),
        ),
      ),
    );
  }
}