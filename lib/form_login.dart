import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile_screen.dart';
import 'dashboard_screen.dart';

class FormLogin extends StatefulWidget {
  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController profileControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Form Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ), // Memberikan padding di sekitar form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header Ucapan Selamat Datang
              Center(
                child: Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(height: 16), // Jarak antara header dan form
              // Form Login
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Teks form di sebelah kiri
                children: [
                  // Input Email
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan email Anda',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16), // Jarak antara email dan password
                  // Input Password
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    obscureText: true, // Menyembunyikan teks untuk password
                    decoration: InputDecoration(
                      hintText: 'Masukkan password Anda',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24), // Jarak antara password dan tombol
                  // Tombol Masuk
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      },
                      child: Text('Masuk'),
                    ),
                  ),
                  //tambahan codingan dari pertemuan ke 3
                  TextField(controller: profileControler),
                  ElevatedButton(
                    onPressed: () {
                      print("TES INPUTAN : ${profileControler.text}");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Profil(name: profileControler.text),
                        ),
                      );
                    },
                    child: Text('Daftar'),
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
