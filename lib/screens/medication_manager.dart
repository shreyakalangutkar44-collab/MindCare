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
                              child: Text("menu", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                            Text(
                              "MindCare Caregiver",
                              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Image.network(
                                  "https://lh3.googleusercontent.com/aida-public/AB6AXuCS2beYYosziqTlGa1Ae0RmQca5tgBNpkiwp-v0z79BewkkVNzwpUNSYvi81-u8qphd3V0IvYUDoLkX6nsL5xG78AE6zr1LppAw7L6-QlMuQoXaBBnhzwmVhMATvlKZYbNw_8oRGRVDN32hywtQb-1pFabEiT3hs3E_qfmbwhklMLgijAYDRikA-hDcne8uyKpg5XtOsxP8qUs2R0J2chCxMZ8ZSgU0TQpKkzibq4paPelvv2LW9Kw",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    height: 180.0,
                                    color: Color(0xFFEEEEEE),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                                  ),
                                ),
                            ),
                          ],
                        ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Manage Care",
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("medication\nMedicines", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("event\nAppointments", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                                  "schedule",
                                                  style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                                ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Amlodipine",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                            Text(
                                              "Blood Pressure",
                                              style: TextStyle(fontSize: 16.0, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                              "09:00 AM",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                        Text(
                                              "1 Tablet",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                      ],
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("check_circle\n                    Mark as Taken", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox.shrink(),
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
                                            Text(
                                              "Donepezil",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                            Text(
                                              "Missed",
                                              style: TextStyle(fontSize: 16.0, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                              "08:00 AM",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                        Text(
                                              "1 Tablet",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                      ],
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("warning\n                    Mark as Taken Now", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
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
                                                  "check_circle",
                                                  style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                                ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Multi-vitamin",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                            Text(
                                              "task_alt\n                                Taken",
                                              style: TextStyle(fontSize: 16.0, fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                              "07:30 AM",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                        Text(
                                              "1 Capsule",
                                              style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                            ),
                                      ],
                                    ),
                                  ],
                                ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("add", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("medication\nMedicines", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("event\nAppointments", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}