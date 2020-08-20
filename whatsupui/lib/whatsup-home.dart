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
        elevation: 10.0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          // labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS")
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.more_vert),
          )
        ],
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
        child: Icon(Icons.chat, color: Colors.white),
        onPressed: () => print("open chats"),
      ),
    );
  }
}
