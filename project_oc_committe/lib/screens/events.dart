import 'package:flutter/material.dart';
import 'package:project_oc_committe/widgets/Calendar.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded( //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
      child: SingleChildScrollView(
        child: Calendar(),
      ),
    );
  }
}