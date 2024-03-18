import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edukasi_mobile/models/model_berita.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berita App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BeritaListScreen(),
    );
  }
}

class BeritaListScreen extends StatefulWidget {
  @override
  _BeritaListScreenState createState() => _BeritaListScreenState();
}

class _BeritaListScreenState extends State<BeritaListScreen> {
  late List<Datum> _beritaList;
  late List<Datum> _filteredBeritaList;
  late bool _isLoading;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _fetchBerita();
    _filteredBeritaList = [];
  }

  Future<void> _fetchBerita() async {
    final response =
        await http.get(Uri.parse('http://10.208.97.54:8080/edukasi/berita.php'));
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
        backgroundColor: Colors.teal,
        title: Text('Berita'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
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
                Expanded(
                  child: Card(
                  child: ListView.builder(
                    itemCount: _filteredBeritaList.length,
                    itemBuilder: (context, index) {
                      final berita = _filteredBeritaList[index];
                      return ListTile(
                        title: Text(berita.judul),
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
                  ),
                ),
              ],
            ),
    );
  }
}

class BeritaDetailScreen extends StatelessWidget {
  final Datum berita;

  const BeritaDetailScreen({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Berita Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              berita.judul,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              berita.konten,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Image.network("http://192.168.1.39/edukasi/${berita.gambar}"),
            Text(
              berita.gambar,
              style: TextStyle(fontSize: 16),
            ),
            // Image.network(berita.gambar),
          ],
        ),
      ),
    );
  }
}
