import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edukasi_mobile/models/model_berita.dart';
import 'package:edukasi_mobile/models/model_user.dart';
import 'package:edukasi_mobile/page_gallery.dart';
import 'package:edukasi_mobile/page_list_user.dart';
import 'package:edukasi_mobile/page_login.dart';
import 'package:edukasi_mobile/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'page_register.dart';
import 'page_berita.dart';
import 'page_pegawai.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageGallery()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PegawaiListScreen()),
      );
    } else if (index == 3) {
      // Ambil data pengguna yang sedang login dari SessionManager
      ModelUsers currentUser = ModelUsers(
        id: int.parse(sessionManager.id!),
        username: sessionManager.username!,
        email: sessionManager.email!,
        fullname: sessionManager.fullname!,
        name: '',
      );

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PageListUser(currentUser: currentUser)),
      );
    }
  }

  String? username;

  Future<void> getDataSession() async {
    bool hasSession = await sessionManager.getSession();
    if (hasSession) {
      setState(() {
        username = sessionManager.username;
        print('Data session: $username');
      });
    } else {
      print('Session tidak ditemukan!');
    }
  }

  late List<Datum> _beritaList;
  late List<Datum> _filteredBeritaList;
  late bool _isLoading;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getDataSession();
    _isLoading = true;
    _fetchBerita();
    _filteredBeritaList = [];
  }

  Future<void> _fetchBerita() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.14/edukasi/berita.php'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      setState(() {
        _beritaList =
            List<Datum>.from(parsed['data'].map((x) => Datum.fromJson(x)));
        _filteredBeritaList = _beritaList;
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load berita');
    }
  }

  void _filterBeritaList(String query) {
    setState(() {
      _filteredBeritaList = _beritaList
          .where((berita) =>
              berita.judul.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita"),
        backgroundColor: Colors.teal,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Hi, ${username ?? ''}', // Greet the user with their username, or an empty string if null
              style: TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 18, // Set font size
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Logout',
            color: Colors.white, // Set icon color to white
            onPressed: () {
              // Clear session
              setState(() {
                sessionManager.clearSession();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PageLogin()),
                  (route) => false,
                );
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.teal.shade100,
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Edukasi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Tetap terkini dengan informasi terbaru dalam dunia pendidikan melalui EduApp, aplikasi berita yang memberikan rangkuman lengkap tentang perkembangan terbaru dalam bidang pendidikan, menawarkan wawasan yang mendalam, dan memperluas pengetahuan Anda."',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterBeritaList,
                  decoration: InputDecoration(
                    labelText: 'Search Berita',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredBeritaList.length,
                      itemBuilder: (context, index) {
                        final berita = _filteredBeritaList[index];
                        return ListTile(
                          title: Text(berita.judul),
                          leading: Image.network(
                            "http://192.168.1.14/edukasi/${berita.gambar}",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BeritaDetailScreen(berita: berita),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationPage(
        onItemTapped: _onItemTapped, // Pass the _onItemTapped function
      ),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  final Function(int) onItemTapped; // Define a function parameter
  const BottomNavigationPage({Key? key, required this.onItemTapped})
      : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  @override
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onTap,
      backgroundColor: Colors.indigo, // Set a background color for the bar
      selectedItemColor: Colors.black54, // Color for the selected item
      unselectedItemColor: Colors.indigo, // Color for the unselected items
      showUnselectedLabels:
          true, // Optional: set to true if you want to always show labels
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'Berita',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_camera),
          label: 'Gallery',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_sharp),
          label: 'Pegawai',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Users',
        ),
      ],
    );
  }
}
