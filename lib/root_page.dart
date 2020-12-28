import 'package:flutter/material.dart';
import 'package:instargram_clone_with_flutter/login_page.dart';
import 'package:instargram_clone_with_flutter/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TabPage(snapshot.data);
        } else {
          return LoginPage();
        }
      },
    );
  }
}
