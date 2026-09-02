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
                            Text(
                                  "check_circle",
                                  style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                ),
                            Text(
                              "Well done!",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                            ),
                            Text(
                              "You found a match.",
                              style: TextStyle(fontSize: 16.0, fontFamily: "Atkinson Hyperlegible Next"),
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
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("close", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                ),
                                Text(
                                  "Memory Match",
                                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700, fontFamily: "Atkinson Hyperlegible Next"),
                                ),
                              ],
                            ),
                            Text(
                                      "Moves: 4",
                                      style: TextStyle(fontFamily: "Atkinson Hyperlegible Next"),
                                    ),
                          ],
                        ),
                        Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("coffee_maker", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("local_florist", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("coffee_maker", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("eco", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("local_florist", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("eco", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x33FFFFFF), Color(0x33FFFFFF)])),
                                      child: SizedBox.shrink(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x33FFFFFF), Color(0x33FFFFFF)])),
                                      child: SizedBox.shrink(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x33FFFFFF), Color(0x33FFFFFF)])),
                                      child: SizedBox.shrink(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x33FFFFFF), Color(0x33FFFFFF)])),
                                      child: SizedBox.shrink(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x33FFFFFF), Color(0x33FFFFFF)])),
                                      child: SizedBox.shrink(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x33FFFFFF), Color(0x33FFFFFF)])),
                                      child: SizedBox.shrink(),
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
                              child: Text("lightbulb\n            Hint", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("refresh\n            Restart", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("mic", style: TextStyle(fontFamily: "Atkinson Hyperlegible Next")),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}