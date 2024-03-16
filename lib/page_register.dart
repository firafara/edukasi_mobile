import 'package:flutter/material.dart';
import 'package:edukasi_mobile/models/model_register.dart';
import 'package:edukasi_mobile/page_login.dart';
import 'package:http/http.dart' as http;

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;

  Future<ModelRegister?> registerAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.post(
        Uri.parse('http://192.168.1.14/edukasi/register.php'),
        body: {
          "username": txtUsername.text,
          "password": txtPassword.text,
          "fullname": txtFullName.text,
          "email": txtEmail.text,
        },
      );

      ModelRegister data = modelRegisterFromJson(res.body);
      //cek kondisi respon
      if (data.value == 1) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${data.message}')),
          );
          //kondisi berhasil dan pindah ke page login
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PageLogin()),
                (route) => false,
          );
        });
        //kondisi email sudah ada
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${data.message}')),
          );
        });
        //kondisi gagal daftar
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${data.message}')),
        );
      }
    } catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Register Form'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'images/logo.png', // ganti dengan path gambar Anda
                  width: 140,
                  height: 150,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh kosong" : null;
                  },
                  controller: txtFullName,
                  decoration: InputDecoration(
                    hintText: "Full Name",
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
                  controller: txtEmail,
                  decoration: InputDecoration(
                    hintText: "Email",
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
                      registerAccount();
                    }
                  },
                  child: Text('Register'),
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => PageLogin()),
                          (route) => false,
                    );
                  },
                  child: Text('Anda Sudah Punya Akun ? Silahkan Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
