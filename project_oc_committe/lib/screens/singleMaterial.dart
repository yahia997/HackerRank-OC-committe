import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';

class singleMaterial extends StatelessWidget {
  const singleMaterial({super.key, this.data});
  final dynamic data; // will contain all information (id-text-images-files-....)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leadingWidth: 65,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // go to previous screen
                    try {
                      Navigator.of(context).pop();
                    } catch (e) {
                      // in case of there are no previous screens
                      log("No previous Screens");
                    }
                  },
                  icon: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(6, 137, 50, 0.4),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: mainGreen,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text(
              "OC Committe",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
        body: Text(data["title"]),
      ),
    );
  }
}
