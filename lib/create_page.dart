import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final User user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController textEdtingController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();

  PickedFile _image;

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
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            final firebaseStorageRef = FirebaseStorage.instance.ref().child('post').child('${DateTime.now().microsecondsSinceEpoch}.png');
            final task = firebaseStorageRef.putFile(File(_image.path), SettableMetadata(contentType: 'image/png'));

            task.then((value) {
              var downloadURL = value.ref.getDownloadURL();
              downloadURL.then((url) {
                var doc = FirebaseFirestore.instance.collection('post').doc();
                doc.set({
                  'id': doc.id,
                  'photoUrl': url.toString(),
                  'contents': textEdtingController.text,
                  'email': widget.user.email,
                  'displayName': widget.user.displayName,
                  'userPhotoUrl': widget.user.photoURL,
                }).then((onValue) {
                  Navigator.pop(context);
                });
              });
            });
          },
        ),
      ],
    );
  }

  Widget _buildBody(double width, double height) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _image == null ? Text('No Image') : Image.file(File(_image.path)),
            TextField(
              controller: textEdtingController,
              decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }
}
