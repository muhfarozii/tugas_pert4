import 'package:flutter/material.dart';
import 'home_screen.dart'; // Impor HomeScreen

class login2 extends StatefulWidget {
  const login2({super.key});

  @override
  State<login2> createState() => _login2State();
}

class _login2State extends State<login2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordNyala = true;
  tampilPassword() {
    setState(() {
      passwordNyala = !passwordNyala;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter Your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: passwordController,
              obscureText: passwordNyala,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter Your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: tampilPassword,
                  icon: Icon(
                    passwordNyala ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                print("email = ${emailController.text}");
                print("Password: ${passwordController.text}");
                print("Navigasi ke HomeScreen");

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
