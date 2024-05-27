import 'package:flutter/material.dart';

import 'albumModal.dart';
import 'api_service_album.dart';


class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = ApiService().fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Album>>(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Albums Available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Album album = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    print('Tapped on: Album ID: ${album.id}, Title: ${album.title}');
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(album.title),
                      subtitle: Text('Album ID: ${album.id}'),
                      leading: Icon(Icons.person_pin),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
