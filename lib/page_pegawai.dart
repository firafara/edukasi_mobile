import 'package:edukasi_mobile/models/model_add_pegawai.dart';
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
    await http.get(Uri.parse('http://192.168.1.14/edukasi/pegawai.php'));
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
      _filteredPegawaiList = List.from(_pegawaiList);
    });
  }

  Future<void> _editPegawai(int index, Datum updatedPegawai) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.14/edukasi/editpegawai.php'),
      body: {
        "id": updatedPegawai.id.toString(),
        "no_bp": updatedPegawai.noBp,
        "email": updatedPegawai.email,
        "no_hp": updatedPegawai.noHp,
      },
    );
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      if (parsed['isSuccess']) {
        setState(() {
          _pegawaiList[index] = updatedPegawai;
          _filteredPegawaiList = List.from(_pegawaiList);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(parsed['message'])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(parsed['message'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to edit pegawai')),
      );
    }
  }

  Future<void> _deletePegawai(int index) async {
    final pegawaiToDelete = _pegawaiList[index];
    final response = await http.post(
      Uri.parse('http://192.168.1.14/edukasi/deletepegawai.php'),
      body: {"id": pegawaiToDelete.id.toString()},
    );
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      if (parsed['isSuccess']) {
        setState(() {
          _pegawaiList.removeAt(index);
          _filteredPegawaiList = List.from(_pegawaiList);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(parsed['message'])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(parsed['message'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete pegawai')),
      );
    }
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PegawaiEditScreen(
                                  pegawai: pegawai,
                                  editPegawai: (updatedPegawai) {
                                    _editPegawai(index, updatedPegawai);
                                  },
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PegawaiDeleteScreen(
                                  deletePegawai: () {
                                    _deletePegawai(index);
                                  },
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PegawaiDetailScreen(
                              pegawai: pegawai,
                            )),
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
              builder: (context) => PageAddPegawai(),
            ),
          );
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
    );
  }
}

class PegawaiEditScreen extends StatelessWidget {
  final Datum pegawai;
  final Function(Datum) editPegawai;

  const PegawaiEditScreen({
    Key? key,
    required this.pegawai,
    required this.editPegawai,
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
        title: Text('Edit Pegawai'),
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
                  id: pegawai.id,
                  noBp: _noBpController.text,
                  email: _emailController.text,
                  noHp: _noHpController.text,
                  createdAt: pegawai.createdAt,
                  updatedAt: pegawai.updatedAt,
                );
                editPegawai(updatedPegawai);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}

class PegawaiDeleteScreen extends StatelessWidget {
  final Function() deletePegawai;

  const PegawaiDeleteScreen({
    Key? key,
    required this.deletePegawai,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Delete Pegawai'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Apakah Anda yakin ingin menghapus Pegawai ini?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                deletePegawai();
                Navigator.pop(context);
              },
              child: Text('Ya, Hapus'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}

class PegawaiDetailScreen extends StatelessWidget {
  final Datum pegawai;

  const PegawaiDetailScreen({
    Key? key,
    required this.pegawai,
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
          ],

        ),
      ),
    );
  }
}

class PageAddPegawai extends StatefulWidget {
  const PageAddPegawai({Key? key}) : super(key: key);

  @override
  State<PageAddPegawai> createState() => _PageAddPegawaiState();
}

class _PageAddPegawaiState extends State<PageAddPegawai> {
  TextEditingController _noBpController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _noHpController = TextEditingController();

  bool isLoading = true;
  Future<ModelAddPegawai?> addPegawai() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.post(
        Uri.parse('http://192.168.1.14/edukasi/addpegawai.php'),
        body: {
          "no_bp": _noBpController.text,
          "no_hp": _noHpController.text,
          "email": _emailController.text,
        },
      );

      ModelAddPegawai data = modelAddPegawaiFromJson(res.body);
      if (data.isSuccess == true) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${data.message}')),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PegawaiListScreen()),
                (route) => false,
          );
        });
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
                setState(() {
                  addPegawai();
                });
              },
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
