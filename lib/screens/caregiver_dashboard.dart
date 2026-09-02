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
                          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox.shrink(),
                            Image.network(
                              "https://lh3.googleusercontent.com/aida-public/AB6AXuB5ZH7B5-5kgrwx95XnOcTPqudZWIoJWgV30XzqI1I1q1XuWnyeeT7T72Ts0xZwMVM0VQc_FCiJepqGfSc8xizBhq1IWZKQTAS-ll0A2-GeEZo_TVmg1o1WpW0G7Y0ERDD7w0Xbej6JGRk2jgnothOhhq9YSw_tRUc1C1myqi5KCb6XYaaPEwj-J5511zTSp0UFEXViFDaa42WnCJroOBS-bQdehK39Ra0ZblIth4SosxTizcXzGW8",
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("check_circle"),
                                    Text("Status: Active"),
                                  ],
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
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("sports_esports"),
                                    Text(
                                      "Games Played",
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Text(
                                  "12",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("military_tech"),
                                    Text(
                                      "Average Score",
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Text(
                                  "840",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("local_fire_department"),
                                    Text(
                                      "Day Streak",
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Text(
                                  "5 Days",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("schedule"),
                                    Text(
                                      "Last Active",
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Text(
                                  "10 mins ago",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weekly Activity",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox.shrink(),
                                    SizedBox.shrink(),
                                    SizedBox.shrink(),
                                    SizedBox.shrink(),
                                  ],
                                ),
                                SizedBox.shrink(),
                                SizedBox.shrink(),
                                SizedBox.shrink(),
                                SizedBox.shrink(),
                                SizedBox.shrink(),
                                SizedBox.shrink(),
                                SizedBox.shrink(),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("M"),
                                Text("T"),
                                Text("W"),
                                Text("T"),
                                Text("F"),
                                Text("S"),
                                Text("S"),
                              ],
                            ),
                          ],
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "notifications_active\n                Recent Insights",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("info"),
                                    Text(
                                      "Missed Story Memory game today.",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                ),
                                Container(
                                  decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("trending_up"),
                                    Text(
                                      "Steady progress observed in Pattern Matching.",
                                      style: TextStyle(fontSize: 16.0),
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
                              child: Text("analytics\n                Detailed Progress"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("medication\n                Manage Medicines"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () { /* Launch # */ },
                          child: Text(
                            "home\nHome",
                            style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                          ),
                        ),
                        InkWell(
                          onTap: () { /* Launch # */ },
                          child: Text(
                            "extension\nGames",
                            style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                          ),
                        ),
                        InkWell(
                          onTap: () { /* Launch # */ },
                          child: Text(
                            "support_agent\nHelp",
                            style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox.shrink(),
                  ],
                ),
      ),
    );
  }
}