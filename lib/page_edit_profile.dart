import 'dart:convert';
import 'package:edukasi_mobile/page_list_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:edukasi_mobile/models/model_user.dart'; // Sesuaikan dengan path model Anda

class PageEditProfile extends StatefulWidget {
  final ModelUsers currentUser;

  const PageEditProfile({required this.currentUser, Key? key}) : super(key: key);

  @override
  _PageEditProfileState createState() => _PageEditProfileState();
}

class _PageEditProfileState extends State<PageEditProfile> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController(); // Tambahkan controller email
  TextEditingController _fullnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.currentUser.username;
    _emailController.text = widget.currentUser.email; // Inisialisasi nilai email dari model
    _fullnameController.text = widget.currentUser.fullname;
  }

  void saveChanges(String newUsername, String newFullName, String newEmail) async {
    // Validasi input sebelum menyimpan perubahan
    if (newUsername.isEmpty || newFullName.isEmpty || newEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('All fields are required')));
      return;
    }

    // Validasi format email menggunakan regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(newEmail)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid email format')));
      return;
    }

    try {
      var url = Uri.parse('http://192.168.1.14/edukasi/updateUser.php');
      var response = await http.post(url, body: {
        'id': widget.currentUser.id.toString(),
        'username': newUsername,
        'email': newEmail,
        'fullname': newFullName,
      });

      var data = json.decode(response.body);

      if (data['is_success']) {
        setState(() {
          widget.currentUser.username = newUsername;
          widget.currentUser.email = newEmail;
          widget.currentUser.fullname = newFullName;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data['message'])));
        Navigator.pop(context);

        // Ganti halaman ke halaman profil yang diperbarui
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PageListUser(currentUser: widget.currentUser)),
        );

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data['message'])));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred')));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.teal, // Warna latar belakang app bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Text(
                  widget.currentUser.username[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.teal,
                radius: 50,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16), // Jarak antar field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16), // Jarak antar field
              TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24), // Jarak antara field dan tombol
              ElevatedButton(
                onPressed: () {
                  // Implement logic to save changes
                  String newUsername = _usernameController.text;
                  String newEmail = _emailController.text; // Ambil nilai dari controller email
                  String newFullName = _fullnameController.text;

                  // Panggil fungsi untuk menyimpan perubahan
                  saveChanges(newUsername, newFullName, newEmail);
                },
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Warna tombol
                  foregroundColor: Colors.white, // Warna teks di atas tombol
                  padding: EdgeInsets.symmetric(vertical: 16), // Padding tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Bentuk tombol
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}