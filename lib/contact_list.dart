import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ContactList());
  }
}

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Kontak',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(leading: Icon(Icons.person), title: Text('April')),
          ListTile(leading: Icon(Icons.person), title: Text('Gibran')),
          ListTile(leading: Icon(Icons.person), title: Text('Ahmad')),
          ListTile(leading: Icon(Icons.person), title: Text('Rio')),
          ListTile(leading: Icon(Icons.person), title: Text('Bagas')),
          ListTile(leading: Icon(Icons.person), title: Text('Isan')),
          ListTile(leading: Icon(Icons.person), title: Text('Awan')),
          ListTile(leading: Icon(Icons.person), title: Text('Valen')),
          ListTile(leading: Icon(Icons.person), title: Text('Adit')),
          ListTile(leading: Icon(Icons.person), title: Text('Candra')),
        ],
      ),
    );
  }
}
