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
                              child: Text("arrow_back", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                            Text(
                              "Alerts & Notifications",
                              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("All", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Unread", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                              "error",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Missed Medicine",
                                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                            Text(
                                                  "10 mins ago",
                                                  style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                                ),
                                          ],
                                        ),
                                        Text(
                                          "Aai missed her morning dose of Memantine. Please check in with her.",
                                          style: TextStyle(fontSize: 16.0, fontFamily: "Atkinson Hyperlegible Next"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("check_circle\n                            Acknowledge", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                              "celebration",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Activity Milestone",
                                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                            Text(
                                                  "2 hours ago",
                                                  style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                                ),
                                          ],
                                        ),
                                        Text(
                                          "Aai completed all cognitive exercises for 3 days in a row! Great job.",
                                          style: TextStyle(fontSize: 16.0, fontFamily: "Atkinson Hyperlegible Next"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("done\n                            Mark as Read", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                              "info",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Daily Summary Ready",
                                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                            Text(
                                                  "Yesterday",
                                                  style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                                ),
                                          ],
                                        ),
                                        Text(
                                          "Review the activity and mood logs from yesterday.",
                                          style: TextStyle(fontSize: 16.0, fontFamily: "Atkinson Hyperlegible Next"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("done\n                            Mark as Read", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("mic", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                        ),
                      ],
                    ),
      ),
    );
  }
}