import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        child: Container(
                  color: Color(0xFFFDF9EE),
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
                          "Pattern Match",
                          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Exit\n            logout"),
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
                              "Round 3 of 5",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                            ),
                            SizedBox.shrink(),
                          ],
                        ),
                        Text(
                              "What comes next?",
                              style: TextStyle(fontSize: 16.0),
                            ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x1F000000), offset: Offset(0.0, 4.0), blurRadius: 16.0, spreadRadius: 0.0)]),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                      "eco",
                                      style: TextStyle(fontSize: 64.0),
                                    ),
                            Text(
                                      "star",
                                      style: TextStyle(fontSize: 64.0),
                                    ),
                            Text(
                                      "eco",
                                      style: TextStyle(fontSize: 64.0),
                                    ),
                            Text("???"),
                          ],
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("circle"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("star"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("eco"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("square"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("record_voice_over"),
                    ),
                  ],
                ),
                ),
      ),
    );
  }
}