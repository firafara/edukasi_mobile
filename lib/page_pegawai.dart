import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edukasi_mobile/models/model_pegawai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pegawai App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PegawaiListScreen(),
    );
  }
}

class PegawaiListScreen extends StatefulWidget {
  @override
  _PegawaiListScreenState createState() => _PegawaiListScreenState();
}

class _PegawaiListScreenState extends State<PegawaiListScreen> {
  late List<Datum> _pegawaiList;
  late List<Datum> _filteredPegawaiList;
  late bool _isLoading;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _fetchPegawai();
    _filteredPegawaiList = [];
  }

  Future<void> _fetchPegawai() async {
    final response =
        await http.get(Uri.parse('http://192.168.100.72/edukasi/pegawai.php'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      setState(() {
        _pegawaiList =
            List<Datum>.from(parsed['data'].map((x) => Datum.fromJson(x)));
        _filteredPegawaiList = _pegawaiList;
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load pegawai');
    }
  }

  void _filterPegawaiList(String query) {
    setState(() {
      _filteredPegawaiList = _pegawaiList
          .where((pegawai) =>
              pegawai.noBp.toLowerCase().contains(query.toLowerCase()) ||
              pegawai.email.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Pegawai'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterPegawaiList,
                    decoration: InputDecoration(
                      labelText: 'Search Pegawai',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredPegawaiList.length,
                    itemBuilder: (context, index) {
                      final pegawai = _filteredPegawaiList[index];
                      return ListTile(
                        title: Text(pegawai.noBp),
                        subtitle: Text(pegawai.email),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PegawaiDetailScreen(pegawai: pegawai),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class PegawaiDetailScreen extends StatelessWidget {
  final Datum pegawai;

  const PegawaiDetailScreen({Key? key, required this.pegawai})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Pegawai Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No BP: ${pegawai.noBp}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Email: ${pegawai.email}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'No HP: ${pegawai.noHp}',
              style: TextStyle(fontSize: 16),
            ),
            // SizedBox(height: 16),
            // Text(
            //   'Created At: ${pegawai.createdAt.toString()}',
            //   style: TextStyle(fontSize: 16),
            // ),
            // SizedBox(height: 16),
            // Text(
            //   'Updated At: ${pegawai.updatedAt.toString()}',
            //   style: TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }
}
