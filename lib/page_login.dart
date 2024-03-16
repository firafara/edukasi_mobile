import 'dart:convert';

import 'package:edukasi_mobile/home.dart';
import 'package:edukasi_mobile/page_register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:edukasi_mobile/utils/session_manager.dart';

import 'models/ModelLogin.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> loginAccount() async {
    try {
      setState(() {
        isLoading = true;
      });

      http.Response res = await http.post(
        Uri.parse('http://192.168.1.14/edukasi/login.php'),
        body: {
          "login": "1",
          "username": txtUsername.text,
          "password": txtPassword.text,
        },
      );

      if (res.statusCode == 200) {
        ModelLogin data = ModelLogin.fromJson(json.decode(res.body));
        if (data.sukses) {
          if (data.data != null && data.data.id != null && data.data.username != null &&
              data.data.fullname != null && data.data.email != null) {
            sessionManager.saveSession(
              data.status,
              data.data.id,
              data.data.username,
              data.data.fullname,
              data.data.email,
            );

            print('Nilai sesi disimpan:');
            print('ID: ${data.data.id}');
            print('Username: ${data.data.username}');
            print('Fullname: ${data.data.fullname}');
            print('Email: ${data.data.email}');

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${data.pesan}')));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else {
            throw Exception('Data pengguna tidak lengkap atau null');
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${data.pesan}')));
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


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
              Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
              ),
              Text(
                'Login Form',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageRegister()),
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
