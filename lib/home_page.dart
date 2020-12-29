import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Instagram Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(width, height),
    );
  }

  Widget _buildBody(double width, double height) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instagram에 오신 것을 환영합니다.',
                  style: TextStyle(fontSize: width * 0.058),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Text(
                  '사진과 동영상을 보려면 팔로우하세요.',
                  style: TextStyle(fontSize: width * 0.043),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                SizedBox(
                  width: width * 0.8,
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoURL),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(6.0),
                          ),
                          Text(
                            user.email,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          Text(user.displayName),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: Image.network(
                                  'https://drx.gg/img/home_image1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(3.0),
                              ),
                              SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: Image.network(
                                  'https://image.edaily.co.kr/images/Photo/files/NP/S/2020/04/PS20042100229.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(3.0),
                              ),
                              SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: Image.network(
                                  'https://image.fmkorea.com/files/attach/new/20200629/14339012/1009639079/2967169244/25580e3af679a2433085bf91588933a6.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          Text('Facobook 친구'),
                          RaisedButton(
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            child: Text('팔로우'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
