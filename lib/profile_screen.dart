import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key, required this.name});

  final String name;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil $name')),
      body: Text('Nama: $name'),
    );
  }
}
