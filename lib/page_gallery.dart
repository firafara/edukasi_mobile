import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'models/model_berita.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PageGallery extends StatefulWidget {
  @override
  _PageGalleryState createState() => _PageGalleryState();
}

class _PageGalleryState extends State<PageGallery> {
  late Future<ModelBerita> futureBerita;

  @override
  void initState() {
    super.initState();
    futureBerita = fetchBerita();
  }

  Future<ModelBerita> fetchBerita() async {
    final response = await http.get(Uri.parse('http://192.168.1.14/edukasi/berita.php'));
    if (response.statusCode == 200) {
      return ModelBerita.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Berita');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Gallery Page'),
      ),
      body: Center(
        child: FutureBuilder<ModelBerita>(
          future: futureBerita,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10, // Horizontal space between items
                    mainAxisSpacing: 10, // Vertical space between items
                  ),
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index) {
                    var imageUrl =
                        "http://192.168.1.14/edukasi/${snapshot.data!.data[index].gambar}";
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(imageUrl: imageUrl),
                          ),
                        );
                      },
                      child: Hero(
                        tag: imageUrl,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Text('Could not load image'),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageUrl;

  const DetailScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Detail Image'),
      ),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Text('Could not load image'),
            ),
          ),
        ),
      ),
    );
  }
}
