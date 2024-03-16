import 'package:edukasi_mobile/page_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:edukasi_mobile/models/model_user.dart'; // Ubah sesuai dengan path model Anda

class PageListUser extends StatelessWidget {
  final ModelUsers currentUser;

  PageListUser({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.teal, // Warna latar belakang avatar
                radius: 50, // Ukuran avatar
                child: Text(
                  currentUser.username[0].toUpperCase(), // Menampilkan huruf pertama username
                  style: TextStyle(
                    fontSize: 40, // Ukuran teks
                    fontWeight: FontWeight.bold, // Ketebalan teks
                    color: Colors.white, // Warna teks
                  ),
                ),
              ),
              SizedBox(height: 20), // Jarak antara avatar dan teks
              Text(
                currentUser.username,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Jarak antara teks
              Text(
                currentUser.email,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10), // Jarak antara teks
              Text(
                currentUser.fullname,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20), // Jarak antara teks dan tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageEditProfile(currentUser: currentUser)),
                  );
                },
                child: Text('Edit Profile'), // Teks tombol
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal), // Warna tombol
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna teks di atas tombol
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 40, vertical: 16)), // Padding tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
