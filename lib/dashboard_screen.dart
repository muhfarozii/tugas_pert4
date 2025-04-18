import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: ElevatedButton(
        onPressed: () {
          // Beralih ke ListView
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profil(name: "budi")),
          );
        },
        child: Text('Go To Profil'),
      ),
    );
  }
}
