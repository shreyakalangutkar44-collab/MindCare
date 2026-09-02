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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Image.network(
                                  "https://lh3.googleusercontent.com/aida-public/AB6AXuCJ-IS2xsy4G6owybVhigyY1oXSkXmoDQ_laRiozZeZzJ3oxRtf2bJ0pnRIYX8QIWsgvBOUrrgG91zr8wDSoiqfFgXRLtNmc6iitE-PlY0DRkgPzdSuYoTAlMQfABoNCtGb7ufzBxaxzJcPzlHqiwZnJKPJq5bh3q98NHttyVTbsVlqW9-tiHq8AzKcaDMo9qF1YUvq7m1tTseorBZBcFQZofKi8PX5abx4TBgWlHlcjGMWiYD2XlM",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    height: 180.0,
                                    color: Color(0xFFEEEEEE),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                                  ),
                                ),
                            ),
                            Text(
                              "Namaste, Arunjyoti",
                              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () { /* Launch # */ },
                              child: Text(
                                "videogame_asset Games",
                                style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                              ),
                            ),
                            InkWell(
                              onTap: () { /* Launch # */ },
                              child: Text(
                                "cloud_upload Voice",
                                style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                              ),
                            ),
                            InkWell(
                              onTap: () { /* Launch # */ },
                              child: Text(
                                "leaderboard Progress",
                                style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Help"),
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
                            Text(
                              "Record a Memory",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("mic"),
                                ),
                                Text(
                                  "Tap to speak",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  "Tell us about your day, a childhood story, or anything on your mind.",
                                  style: TextStyle(fontSize: 16.0),
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
                                  "Listen to Past Memories",
                                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("See All chevron_right"),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x141C1C15), offset: Offset(0.0, 4.0), blurRadius: 24.0, spreadRadius: -4.0)]),
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Morning Walk in the Garden",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "calendar_today Today, 9:00 AM",
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                        Text("2:15"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("play_arrow"),
                                        ),
                                        SizedBox.shrink(),
                                      ],
                                    ),
                                  ],
                                ),
                                ),
                                Container(
                                  decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x141C1C15), offset: Offset(0.0, 4.0), blurRadius: 24.0, spreadRadius: -4.0)]),
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Festival Preparations",
                                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "calendar_today Yesterday, 4:30 PM",
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                        Text("4:40"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("play_arrow"),
                                        ),
                                        SizedBox.shrink(),
                                      ],
                                    ),
                                  ],
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("smart_toy"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () { /* Launch # */ },
                          child: Text(
                            "videogame_asset\nGames",
                            style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                          ),
                        ),
                        InkWell(
                          onTap: () { /* Launch # */ },
                          child: Text(
                            "cloud_upload\nVoice",
                            style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                          ),
                        ),
                        InkWell(
                          onTap: () { /* Launch # */ },
                          child: Text(
                            "leaderboard\nProgress",
                            style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}
