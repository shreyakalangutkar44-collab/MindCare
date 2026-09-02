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
                            Image.network(
                                  "https://lh3.googleusercontent.com/aida-public/AB6AXuC-aNXMSwhIS1jKXPAIvr_o3p-4rYvhqyE7mr8QC2yfYS2o5vqDVwDMBNkYhIgB_B5RaV5WjS05jaQNUdYCsJYlU5-1Yfu7qHsim144VEjp9H9ryBQrIw96TWcAlSaQK5RyaBuB8FQiPEYINBx7J_gp_uB6xHMWmjWRnHEgOsMTFV4bZ9i2BGCgKx_-Qmi-AbsDBokbbBrmz58MUK6590QdgAIqD_G9OuimZGcZr_lVcb3Tlj0sZRY",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    height: 180.0,
                                    color: Color(0xFFEEEEEE),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                                  ),
                                ),
                            Text(
                              "Namaste, Arunjyoti",
                              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
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
                              "How are you feeling today?",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("😊\nHappy"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("😌\nCalm"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("😐\nNeutral"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("🥱\nTired"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("😔\nSad"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Week So Far",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox.shrink(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 48.0,
                                          height: 48.0,
                                          color: Color(0xFFEEEEEE),
                                          alignment: Alignment.center,
                                          child: Icon(Icons.image, size: 32.0, color: Color(0xFF9E9E9E)),
                                        ),
                                        Text("50%"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Daily Goal",
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        Text(
                                          "2 of 4 exercises done",
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
                                        SizedBox.shrink(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("videogame_asset"),
                                            Text("Games Played"),
                                          ],
                                        ),
                                        Text("12"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox.shrink(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("local_fire_department"),
                                            Text("Current Streak"),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("5"),
                                            Text("days"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x33FFFFFF), Color(0x33FFFFFF)])),
                                          child: SizedBox.shrink(),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("emoji_events"),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Top Score"),
                                                Text("850 pts"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("View Details"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox.shrink(),
                                Text("favorite"),
                                Text(
                                  "\"You're doing a wonderful job today, Arunjyoti!\"",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                        ElevatedButton(
                              onPressed: () {},
                              child: Text("mic"),
                            ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("videogame_asset\nGames"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("cloud_upload\nVoice"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("leaderboard\nProgress"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("videogame_asset\nGames"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("cloud_upload\nVoice"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("leaderboard\nProgress"),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}