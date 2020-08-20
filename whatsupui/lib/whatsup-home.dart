import 'package:flutter/material.dart';

import 'pages/call-screen.dart';
import 'pages/camera-screen.dart';
import 'pages/chat-screen.dart';
import 'pages/status-screen.dart';

class WhatsUpHome extends StatefulWidget {
  @override
  _WhatsUpHomeState createState() => _WhatsUpHomeState();
}

class _WhatsUpHomeState extends State<WhatsUpHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsUp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS")
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.message, color: Colors.white),
        onPressed: () => print("open chats"),
      ),
    );
  }
}
