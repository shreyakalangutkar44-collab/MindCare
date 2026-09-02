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
                        Image.network(
                              "https://lh3.googleusercontent.com/aida-public/AB6AXuA1GxBGS6kQ3quUflTufYzbUlWM38bX7dH6Yk7Q3ffpA7Qx5MKuGF1HwWZGFnmv6V1PKX1s3k2U1rsn9Qv-dJMIUv8YaX70Ny3LwJcQo7tsnPZ7Gn2hFFTn86mrYlUmL-8r_bdZIwp303dbhVlo6EF_XsJ5Z_1BWc1AteJFgQdcAItL8Aiom9yUgFVt0LzPmVPfH0xk0j-rw-GYMIO4qLBPMS1khsYMOryOUjgptyO8e9ZtHOAPH4M",
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
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Help"),
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
                              "It is a beautiful day for some gentle brain exercise. Take your time and enjoy the activities.",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox.shrink(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("eco"),
                                    Text("Today's brain exercise: 2/4"),
                                  ],
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
                              child: Text("style\n\nMemory Match\nFind the pairs"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("category\n\nPattern Game\nFollow the sequence"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("menu_book\n\nStory Memory\nRemember the tale"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("photo_frame\n\nPersonalized Memory\nFamily and friends"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                          onPressed: () {},
                          child: Text("mic\nTalk to me"),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "https://lh3.googleusercontent.com/aida-public/AB6AXuCdmmLaA3fsoxkkxprX2OiWymb2NeaHd38xyqon6k9z32YmSQx_5jgCfkckDGuFOR4TapjPDDC4J0cwUhpZSqYmcSwdfFw_vVBNEdtHZC4qPVx1GqL7vF_KT9mDU95OMIaK_qURt-gokhtppVjaHX19gvlqaaqUs7vh8mA2penKVTzpWhH4Bvw4vgx9zy1AGpykdBvtcQ-78GEiAMx41VwV9Cixi_K2qIYV706G898k5m8Myy51kIY",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 180.0,
                                color: Color(0xFFEEEEEE),
                                alignment: Alignment.center,
                                child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                              ),
                            ),
                            Text(
                              "Arunjyoti Baruah",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Exercise 2 of 4 today",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              "Goal: 15 mins",
                              style: TextStyle(fontSize: 16.0),
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
                              child: Text("history_edu\nExercise Log"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("auto_stories\nCultural Stories"),
                            ),
                            ElevatedButton(
                                  onPressed: () {},
                                  child: Text("settings\nSettings"),
                                ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}