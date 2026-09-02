import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        child: Container(
                  color: Color(0xFFF8F4E8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.shrink(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "https://lh3.googleusercontent.com/aida/AEtjO1Vnh0XxZj92-VSJdQZpEKlLMG1RePspw3AV4L-URkYdoyBDRUG7JIICtPpdCgrVTXupx5AjIfnEZSRCf4atiT4LhlqSQ7dckGEo8dIli4Ust-PtM8YoYV_5qFBNpZQGh_RXTmRM-8ba89Eutd-S35jxH1qZlEEEpFlZ2LCj9jmn426twQX8Clvps6-X7QXtw7zGkymwnILd4tLM7rNKnYQIfJFoeLcgLI0YCUSdm9DJ81r0gOJUzfT4dQ",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 180.0,
                                color: Color(0xFFEEEEEE),
                                alignment: Alignment.center,
                                child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                              ),
                            ),
                            Text(
                              "MindCare",
                              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                            ),
                            Text(
                              "Your daily cognitive companion",
                              style: TextStyle(fontSize: 16.0, fontFamily: "Atkinson Hyperlegible Next"),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8DA189), foregroundColor: Color(0xFF263725)),
                              child: Text("elderly\n                I am a Patient", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: Color(0x00000000), foregroundColor: Color(0xFF434841)),
                              child: Text("health_and_safety\n                I am a Caregiver", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
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
                                  "Phone or Email",
                                  style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter your phone or email",
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Enter your password",
                                      ),
                                      obscureText: true,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("visibility_off", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF79301C), foregroundColor: Color(0xFFFFFFFF)),
                              child: Text("Login", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Forgot Password?", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                            SizedBox.shrink(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Don't have an account? Register", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
      ),
    );
  }
}