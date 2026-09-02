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
                          "Patient Progress",
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
                            Image.network(
                              "https://lh3.googleusercontent.com/aida-public/AB6AXuBZ14gTbmuNM-HVXOqPRLLd-gNDonezmcCFuVKEOEj-47TuTXmkapF7hDnCX2OGblxMs5AnKo5B4eK-BtExy6aAWl8vPfUFjJxMH6PxK7GC3jOg6CD_-rfrHpxLEHVSP83FK-zm_N-eUTc66XXEn44ZFQEIxO6WXsyrmfWhaBHsQliCHCe5MiArbA6ahiDfn9nHkSajtx6O1uPeJDd1GEpZiTvcfNt54Q_VFokpn_FRCyS6j7yKDJU",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 180.0,
                                color: Color(0xFFEEEEEE),
                                alignment: Alignment.center,
                                child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Arunjyoti Baruah",
                                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Caregiver: Priya Baruah",
                                  style: TextStyle(fontSize: 16.0),
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
                                  child: Text("Week"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Month"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("All Time"),
                                ),
                              ],
                            ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Performance Breakdown",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
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
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(child: Text("extension")),
                                            Flexible(child: Text("Memory Match")),
                                          ],
                                        ),
                                        Text("Level 4"),
                                      ],
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
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(child: Text("grid_view")),
                                            Flexible(child: Text("Pattern Game")),
                                          ],
                                        ),
                                        Text("Level 3"),
                                      ],
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
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(child: Text("auto_stories")),
                                            Flexible(child: Text("Story Memory")),
                                          ],
                                        ),
                                        Text("Level 5"),
                                      ],
                                    ),
                                    SizedBox.shrink(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Activity",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 6.0, right: 8.0), child: Icon(Icons.circle, size: 6.0)),
                                      Expanded(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                                    "extension",
                                                    style: TextStyle(fontSize: 16.0),
                                                  ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Memory Match",
                                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                                              ),
                                              Text(
                                                "Today, 10:30 AM",
                                                style: TextStyle(fontSize: 16.0),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                        Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                                "850",
                                                style: TextStyle(fontSize: 16.0),
                                              ),
                                          Text(
                                                "pts",
                                                style: TextStyle(fontSize: 16.0),
                                              ),
                                        ],
                                      ),
                                      ],
                                    )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 6.0, right: 8.0), child: Icon(Icons.circle, size: 6.0)),
                                      Expanded(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                                    "auto_stories",
                                                    style: TextStyle(fontSize: 16.0),
                                                  ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Cultural Stories",
                                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                                              ),
                                              Text(
                                                "Yesterday, 4:15 PM",
                                                style: TextStyle(fontSize: 16.0),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                        Text(
                                                "Completed",
                                                style: TextStyle(fontSize: 16.0),
                                              ),
                                      ],
                                    )),
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
                            Text(
                              "Caregiver Notes",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Notes and observations"),
                                TextField(
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Add observations or reminders for Arunjyoti...",
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Save Note"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("mic"),
                    ),
                  ],
                ),
      ),
    );
  }
}