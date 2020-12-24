import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEdtingController = TextEditingController();

  @override
  void dispose() {
    textEdtingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(width, height),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody(double width, double height) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text('No Image'),
          TextField(
            controller: textEdtingController,
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          ),
        ],
      ),
    );
  }
}
