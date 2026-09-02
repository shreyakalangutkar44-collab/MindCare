import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("menu"),
                        ),
                        Text(
                          "MindCare",
                          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox.shrink(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x141C1C15), offset: Offset(0.0, 4.0), blurRadius: 24.0, spreadRadius: 0.0)]),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x0851634E), Color(0x0851634E)])),
                              child: SizedBox.shrink(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("light_mode"),
                                Text(
                                  "Today's Reminders",
                                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Wednesday, Oct 25",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x141C1C15), offset: Offset(0.0, 4.0), blurRadius: 24.0, spreadRadius: 0.0)]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("medication"),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Morning Tablet",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                            ),
                                            Text("08:00 AM"),
                                          ],
                                        ),
                                        Text(
                                          "Take with food",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("check_circle\n                            Mark as Done"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x141C1C15), offset: Offset(0.0, 4.0), blurRadius: 24.0, spreadRadius: 0.0)]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("directions_walk"),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Morning Walk",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                            ),
                                            Text("07:00 AM"),
                                          ],
                                        ),
                                        Text(
                                          "15 minutes in the garden",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("check_circle\n                            Mark as Done"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x141C1C15), offset: Offset(0.0, 4.0), blurRadius: 24.0, spreadRadius: 0.0)]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("water_drop"),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Drink Water",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                            ),
                                            Text("10:30 AM"),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("task_alt"),
                                            Text("Completed"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x141C1C15), offset: Offset(0.0, 4.0), blurRadius: 24.0, spreadRadius: 0.0)]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("stethoscope"),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Dr. Baruah",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                            ),
                                            Text("11:30 AM"),
                                          ],
                                        ),
                                        Text(
                                          "Routine Checkup",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("check_circle\n                            Mark as Done"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("home\nHome"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("extension\nGames"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("support_agent\nHelp"),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("add"),
                    ),
                  ],
                ),
      ),
    );
  }
}