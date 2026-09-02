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
                            Container(
                              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0x00000000), Color(0x00000000), Color(0x33FFFFFF), Color(0x33FFFFFF)])),
                              child: SizedBox.shrink(),
                            ),
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
                                  "Aalamban MindCare",
                                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Your daily cognitive companion",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Select your role"),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Radio<String>(
                                              value: "patient",
                                              groupValue: null,
                                              onChanged: (v) {},
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("elderly"),
                                                Text("Patient"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Radio<String>(
                                              value: "caregiver",
                                              groupValue: null,
                                              onChanged: (v) {},
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("volunteer_activism"),
                                                Text("Caregiver"),
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
                                    Text("Full Name"),
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Enter your full name",
                                        labelText: "fullName",
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Phone Number"),
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Enter phone number",
                                        labelText: "phone",
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Password"),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Create a password",
                                            labelText: "password",
                                          ),
                                          obscureText: true,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("visibility"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Confirm Password"),
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Confirm your password",
                                        labelText: "confirmPassword",
                                      ),
                                      obscureText: true,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Age"),
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Enter age",
                                        labelText: "dynamicInput",
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Create Account\n                    arrow_forward"),
                                ),
                              ],
                            ),
                            Text(
                                  "Already have an account? \n                    Login",
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
                ),
      ),
    );
  }
}