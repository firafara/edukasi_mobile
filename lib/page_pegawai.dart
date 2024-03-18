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

  void _addPegawai(Datum pegawai) {
    setState(() {
      _pegawaiList.add(pegawai);
      _filteredPegawaiList = _pegawaiList;
    });
  }

  void _editPegawai(int index, Datum updatedPegawai) {
    setState(() {
      _pegawaiList[index] = updatedPegawai;
      _filteredPegawaiList = _pegawaiList;
    });
  }

  void _deletePegawai(int index) {
    setState(() {
      _pegawaiList.removeAt(index);
      _filteredPegawaiList = _pegawaiList;
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
                      return Card(
                        child: ListTile(
                          title: Text(pegawai.noBp),
                          subtitle: Text(pegawai.email),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PegawaiDetailScreen(
                                  pegawai: pegawai,
                                  editPegawai: (updatedPegawai) {
                                    _editPegawai(index, updatedPegawai);
                                  },
                                  deletePegawai: () {
                                    _deletePegawai(index);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahPegawaiScreen(
                tambahPegawai: _addPegawai,
              ),
            ),
          );
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
    );
  }
}

class PegawaiDetailScreen extends StatelessWidget {
  final Datum pegawai;
  final Function(Datum) editPegawai;
  final Function() deletePegawai;

  const PegawaiDetailScreen({
    Key? key,
    required this.pegawai,
    required this.editPegawai,
    required this.deletePegawai,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _noBpController =
        TextEditingController(text: pegawai.noBp);
    TextEditingController _emailController =
        TextEditingController(text: pegawai.email);
    TextEditingController _noHpController =
        TextEditingController(text: pegawai.noHp);

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
            TextField(
              controller: _noBpController,
              decoration: InputDecoration(labelText: 'No BP'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _noHpController,
              decoration: InputDecoration(labelText: 'No HP'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Datum updatedPegawai = Datum(
                  noBp: _noBpController.text,
                  email: _emailController.text,
                  noHp: _noHpController.text,
                );
                editPegawai(updatedPegawai);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                deletePegawai();
                Navigator.pop(context);
              },
              child: Text('Delete'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TambahPegawaiScreen extends StatelessWidget {
  final Function(Datum) tambahPegawai;

  const TambahPegawaiScreen({Key? key, required this.tambahPegawai})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _noBpController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _noHpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Tambah Pegawai'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _noBpController,
              decoration: InputDecoration(labelText: 'No BP'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _noHpController,
              decoration: InputDecoration(labelText: 'No HP'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Datum newPegawai = Datum(
                  noBp: _noBpController.text,
                  email: _emailController.text,
                  noHp: _noHpController.text,
                );
                tambahPegawai(newPegawai);
                Navigator.pop(context);
              },
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
