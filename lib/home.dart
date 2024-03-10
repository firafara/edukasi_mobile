import 'package:edukasi_mobile/page_list_user.dart';
import 'package:flutter/material.dart';
import 'page_register.dart'; // Import halaman registrasi

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

    if (index == 1) { // Index 1 corresponds to "Form Register" tab
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageRegister()),
      );
    }else if(index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageRegister()),
      );
    }else if(index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageListUser()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
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
          ],
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
  const BottomNavigationPage({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this); // Change length to 4 for 4 tabs
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        controller: tabController,
        onTap: widget.onItemTapped, // Call the _onItemTapped function
        tabs: const [
          Tab(
            text: "Home",
            icon: Icon(Icons.input),
          ),
          Tab(
            text: "Form Register",
            icon: Icon(Icons.grid_on),
          ),
          Tab(
            text: "Berita",
            icon: Icon(Icons.search),
          ),
          Tab( // New Tab
            text: "Users",
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
