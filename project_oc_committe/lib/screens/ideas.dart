import 'package:flutter/material.dart';

class Ideas extends StatelessWidget {
  const Ideas({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded( //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
      child: SingleChildScrollView(
        child: Text("Ideas"),
      ),
    );
  }
}