import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(width, height),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildBody(double width, double height) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1274753603899518976/lvBoRdDD.jpg'),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
              ),
              Text(
                'Name',
                style: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            '0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: width * 0.045),
          ),
          Text(
            '0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: width * 0.045),
          ),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: width * 0.045),
          ),
        ],
      ),
    );
  }
}
