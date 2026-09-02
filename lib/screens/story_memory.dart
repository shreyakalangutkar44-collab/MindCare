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
                              child: Text("close"),
                            ),
                            Text(
                              "MindCare",
                              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("account_circle"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Question 1 of 3"),
                            SizedBox.shrink(),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                  "https://lh3.googleusercontent.com/aida-public/AB6AXuDaEalqtkSOq3NShCMluiVEVq4kbt5Yh0Adp9Iqa4WyK3N0cr5qKB72pf7C-0TU_tfEn2LNa6RD-ZJhXkpHQadVy4JwzX3nzJPlccFKYHA-XOOlFm_oC8aam5kZ_6XF9-6g6LNYzo0KiJWDXITBfkHlIeerEFCSUSqQdK7x308cNUX9cl07LybmB2sdSqxKxthb0UXAGzM2pa5VWElrXO-4kqi31kZ6jd-w1KtQKJkWmc3pmxh98dM",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    height: 180.0,
                                    color: Color(0xFFEEEEEE),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                                  ),
                                ),
                            Text(
                              "It was early morning. The sun had just come up. Aita took her basket and went to the garden. She carefully picked the fresh, young tea leaves. She wanted to make a special cup of tea for the family.",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What was Aita picking?",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Flowers for puja"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Fresh tea leaves"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Vegetables for lunch"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                              onPressed: () {},
                              child: Text("Next\n                arrow_forward"),
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