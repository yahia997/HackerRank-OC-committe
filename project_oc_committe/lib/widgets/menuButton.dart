import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';

class Button extends StatefulWidget {
  const Button({super.key, required this.active, required this.text});
  final bool active;
  final String text;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 44,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: 120,
                height: widget.active ? 6 : 0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6)
                  ),
                  shape: BoxShape.rectangle,
                  color: mainGreen,
                ),
              )
            ],
          ),
        ));
  }
}
