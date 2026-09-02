import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SingleChildScrollView(
        child: Container(
                  decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x08974731), Color(0x00000000)])),
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
                          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x261C1C15), offset: Offset(0.0, 8.0), blurRadius: 32.0, spreadRadius: 0.0)]),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "https://lh3.googleusercontent.com/aida-public/AB6AXuB2MBY37hDAsulhoUCYmzuCncjlW6SPgXKPjtA9yckh6PpxRGz0Cw5pE7CEpyUe73ydkq2P42hP2erTngs5SOlgdLNI_M04BIWREk0giznF163cEzCrIwYUpqy-jLnwsaJ2NDIzMIGrdwH8Q4xhyeow0f7jpsmJ83RJa8ZpC-eNPLNZEEwDAFYeLdvn5-n8CAhwf1BMBxF-gPpV8tsMw0hprOnN7BiqfsM7lM0hnEC29rbfFWEYvOY",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 180.0,
                                color: Color(0xFFEEEEEE),
                                alignment: Alignment.center,
                                child: Icon(Icons.broken_image, color: Color(0xFF9E9E9E)),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("volume_up\nHear again"),
                            ),
                          ],
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Who is in this photo with you?",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Take your time to look closely.",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("person\n\nYour Son, Raj\nchevron_right"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("person\n\nYour Daughter, Priya\nchevron_right"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("person\n\nYour Grandson, Rahul\nchevron_right"),
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
      ),
    );
  }
}