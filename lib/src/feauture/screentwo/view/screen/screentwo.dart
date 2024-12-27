import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  final String name;
  final String birthDate;

  const ScreenTwo({
    super.key,
    required this.name,
    required this.birthDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "الاسم: $name",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                "تاريخ الميلاد: $birthDate",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
