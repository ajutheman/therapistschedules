import 'package:flutter/material.dart';

class senedules extends StatelessWidget {
  const senedules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 49,
          color: Colors.cyanAccent,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Select Date"),
              SizedBox(width: 130),
              Text(" Therapist 1")
            ],
          ),
        ),
      ]),
    );
  }
}
