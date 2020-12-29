import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instargram_clone_with_flutter/create_page.dart';
import 'package:instargram_clone_with_flutter/detail_post_page.dart';

class SearchPage extends StatefulWidget {
  final User user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(width, height),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePage(widget.user),
            ),
          );
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody(double width, double height) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('post').where('email', isEqualTo: widget.user.email).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var items = snapshot.data.documents ?? []; // documents is null -> items = []

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildListItem(context, items[index]);
          },
        );
      },
    );
  }

  Widget _buildListItem(context, document) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailPostPage(document);
          },
        ));
      },
      child: Image.network(
        document['photoUrl'],
        fit: BoxFit.cover,
      ),
    );
  }
}
