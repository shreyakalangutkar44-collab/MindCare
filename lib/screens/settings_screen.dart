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
                          child: Text("arrow_back"),
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox.shrink(),
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
                                              "language",
                                              style: TextStyle(fontSize: 28.0),
                                            ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Language"),
                                        Text("Assamese"),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                      "chevron_right",
                                      style: TextStyle(fontSize: 32.0),
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
                                              "speed",
                                              style: TextStyle(fontSize: 28.0),
                                            ),
                                    Text("Voice Speed"),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Slow"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Normal"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Fast"),
                                    ),
                                  ],
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
                                              "format_size",
                                              style: TextStyle(fontSize: 28.0),
                                            ),
                                    Text("Text Size"),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("A-"),
                                    ),
                                    Text("Large"),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("A+"),
                                    ),
                                  ],
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
                                              "volume_up",
                                              style: TextStyle(fontSize: 28.0),
                                            ),
                                    Text("Sound Effects"),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (v) {},
                                    ),
                                    SizedBox.shrink(),
                                  ],
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
                                              "cloud_off",
                                              style: TextStyle(fontSize: 28.0),
                                            ),
                                    Text("Offline Mode"),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (v) {},
                                    ),
                                    SizedBox.shrink(),
                                  ],
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
                                              "person",
                                              style: TextStyle(fontSize: 28.0),
                                            ),
                                    Text("My Profile"),
                                  ],
                                ),
                                Text(
                                      "chevron_right",
                                      style: TextStyle(fontSize: 32.0),
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
                                              "help_center",
                                              style: TextStyle(fontSize: 28.0),
                                            ),
                                    Text("Help & Support"),
                                  ],
                                ),
                                Text(
                                      "chevron_right",
                                      style: TextStyle(fontSize: 32.0),
                                    ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox.shrink(),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("smart_toy"),
                    ),
                  ],
                ),
      ),
    );
  }
}