import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_with_state.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; // Impor ColorPicker

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variabel untuk menyimpan data default
  final TextEditingController _nameController = TextEditingController(
    text: 'Muhammad Al Farozi',
  ); //Untuk menyimpan variabel nama
  final TextEditingController _emailController = TextEditingController(
    text: 'alfarozi@gmail.com',
  ); // Untuk menyimpan variabel email
  String _selectedGender = 'Laki-laki'; // Tampilan default gender
  String? _selectedDate = '01-01-2000'; // Tampilan default tanggal lahir

  // Untuk menyimpan warna background
  Color _backgroundColor = Colors.white;

  // Fungsi untuk menampilkan menu pemilihan warna
  void _pickColor() {
    showDialog(
      context: context,
      builder: (context) {
        Color tempColor = _backgroundColor; // Warna sementara
        return AlertDialog(
          title: Text('Pilih Warna Background'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _backgroundColor,
              onColorChanged: (color) {
                tempColor = color; // Perbarui warna sementara
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog tanpa menyimpan
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _backgroundColor = tempColor; // Simpan warna yang dipilih
                });
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _backgroundColor, // Gunakan warna background yang dipilih
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        title: Text(
          'Personal Information',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => login2()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens, color: Colors.black),
            onPressed: _pickColor, // Buka dialog pemilih warna
          ),
        ],
        titleSpacing: 4,
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.contact_page, size: 40),
            Icon(Icons.search, size: 40),
            Icon(Icons.person, size: 40),
          ],
        ),
      ),

      body: Center(
        // child: Padding(
        //   padding: const EdgeInsets.only(top: 16),),
        child: Column(
          children: [
            SizedBox(height: 16), //memberi jarak antara appbar dan body
            Text(
              'Identitas Diri',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),

            SizedBox(height: 16),

            Stack(
              fit: StackFit.loose,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color.fromARGB(255, 109, 109, 109),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 206, 206, 206),
                    ),
                    child: Icon(Icons.edit, size: 16, color: Colors.black),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8), //memberi jarak antara circle dan text

            SizedBox(height: 16),
            // form profile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama
                  Text(
                    'Full Name:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Nama lengkap Anda',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  //Email
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan email Anda',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    'Jenis Kelamin:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    value: _selectedGender,
                    items:
                        ['Laki-laki', 'Perempuan']
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                    hint: Text('Pilih Jenis Kelamin Anda'),
                  ),

                  SizedBox(height: 16),

                  //Tanggal Lahir
                  Text(
                    'Tanggal Lahir:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: _selectedDate ?? 'Pilih Tanggal Lahir Anda',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDate =
                              '${pickedDate.day}-${pickedDate.month}-${pickedDate.year}';
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
