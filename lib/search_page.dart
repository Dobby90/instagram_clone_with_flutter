import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instargram_clone_with_flutter/create_page.dart';

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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return _buildListItem(context, index);
      },
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
      'https://image.fmkorea.com/files/attach/new/20200629/14339012/1009639079/2967169244/25580e3af679a2433085bf91588933a6.jpg',
      fit: BoxFit.cover,
    );
  }
}
