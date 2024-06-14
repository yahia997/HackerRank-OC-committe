// Yahya Mahmoud
// This widget repersents a single person in members section
import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  const Person({super.key, required this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
            backgroundColor: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            data["name"],
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
