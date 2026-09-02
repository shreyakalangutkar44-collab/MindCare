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
                            Image.network(
                                  "https://lh3.googleusercontent.com/aida-public/AB6AXuDgJl-fkGgqUHSQbq0bWV70CUFK4sb2KlkwqV0qtaYUVHZ9V6Q4zn7TF5FoxE4haKvAdN0orRblR9xjOhn0lcgSjl6Cf9DWMHIf_Jrn5GpaFAeeLhUS0O6Vb1AOrD7_D5fnIflsZchrmA9yf3nRCxuGKmHw_2m5j9YstVbtVy_QkCJ35Qu6Tbpd1i6ne9YhVJfqSVw87PoO0QN2no4av-ncQSKhuQqRsn6a2W0auMri5D-1wUxm68g",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    height: 180.0,
                                    color: Color(0xFFEEEEEE),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                                  ),
                                ),
                          ],
                        ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 16.0), blurRadius: 24.0, spreadRadius: -12.0)]),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Color(0xFFF1EEE3),
                              child: SizedBox.shrink(),
                            ),
                            Image.network(
                                  "https://lh3.googleusercontent.com/aida-public/AB6AXuC78-jV8C4mY2j6QzU9zoJxfd3a6KtIPL5wJLI3L4QhI9CJATxWQke4c8PobDT48g49jgQ-kl6hijQNEXY1A2A-Ho7uoVow48vMlA93R4gISQhoGskr2z949W5AKf6-h04ZR3keOAN7f0Tyzcw5NvQ3ZEhjvQqryaS-LjRafkaG0osKIYJUh7vWmQ__sePdLWALX9cQBxKAYrgB2q3szJwn6N2Do7q8UNpjgvMMhG0cseSLiY9dTKc",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    height: 180.0,
                                    color: Color(0xFFEEEEEE),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                                  ),
                                ),
                            Text(
                              "Aparna Baruah",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                            ),
                            Text("Patient"),
                          ],
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Personal Details",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 16.0), blurRadius: 24.0, spreadRadius: -12.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("person"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Full Name"),
                                    Text("Aparna Baruah"),
                                  ],
                                ),
                              ],
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 16.0), blurRadius: 24.0, spreadRadius: -12.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("cake"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Age"),
                                    Text("72 years"),
                                  ],
                                ),
                              ],
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 16.0), blurRadius: 24.0, spreadRadius: -12.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("call"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Phone"),
                                    Text("+91 98765 43210"),
                                  ],
                                ),
                              ],
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 16.0), blurRadius: 24.0, spreadRadius: -12.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("language"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Language"),
                                    Text("Assamese"),
                                  ],
                                ),
                              ],
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F1C1C15), offset: Offset(0.0, 16.0), blurRadius: 24.0, spreadRadius: -12.0)]),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("emergency"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Emergency Contact"),
                                    Text("Raj (Son)"),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("call\n                        +91 98765 00000"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("edit\n                Edit Profile"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("swap_horiz\n                Switch to Caregiver View"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("logout\n                Logout"),
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
                                "extension\nGames",
                                style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                              ),
                            ),
                            InkWell(
                              onTap: () { /* Launch # */ },
                              child: Text(
                                "mic\nVoice",
                                style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                              ),
                            ),
                            InkWell(
                              onTap: () { /* Launch # */ },
                              child: Text(
                                "trending_up\nProgress",
                                style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                              ),
                            ),
                            InkWell(
                              onTap: () { /* Launch # */ },
                              child: Text(
                                "person\nProfile",
                                style: TextStyle(color: Color(0xFF1976D2), decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                    Text("mic"),
                  ],
                ),
      ),
    );
  }
}