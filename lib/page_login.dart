import 'package:edukasi_mobile/home.dart';
import 'package:edukasi_mobile/page_register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:edukasi_mobile/utils/session_manager.dart';

import 'models/ModelLogin.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;
  Future<ModelLogin?> loginAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.post(
          Uri.parse('http://192.168.1.11/edukasi/login.php'),
          body: {
            "username": txtUsername.text,
            "password": txtPassword.text,

          });

      ModelLogin data = modelLoginFromJson(res.body);
      //cek kondisi respon
      if (data.value == 1) {
        setState(() {
          isLoading = false;
          sessionManager.saveSession(data.value ?? 0, data.id ?? "", data.username ?? "", data.fullname ?? "");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
          //kondisi berhasil dan pindah ke page login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
        });
        //kondisi email sudah ada
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
        //kondisi gagal daftar
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${data.message}')));
      }
    } catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Widget untuk menampilkan gambar/logo (jika diperlukan)
              Image.asset(
                'images/logo.png', // ganti dengan path gambar Anda
                width: 100, // atur lebar gambar
                height: 100, // atur tinggi gambar
              ),

              // Widget untuk menampilkan judul/login text
              Text(
                'Login Form',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.0),

              // Widget untuk form login
              Form(
                key: keyForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Tidak Boleh kosong" : null;
                      },
                      controller: txtUsername,
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Tidak Boleh kosong" : null;
                      },
                      controller: txtPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (keyForm.currentState?.validate() == true) {
                          loginAccount();
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.0),

              // Widget untuk navigasi ke halaman registrasi
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PageRegister()),
                        (route) => false,
                  );
                },
                child: Text('Anda Belum Punya Akun ? Silahkan Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
