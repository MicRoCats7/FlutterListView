import 'package:flutter/material.dart';
import 'package:listviewflutter/listview.dart';

class tabBar extends StatelessWidget {
  const tabBar({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          backgroundColor: Colors.green,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.account_box_sharp),
              ),
              Tab(
                icon: Icon(Icons.add_box_outlined),
              ),
              Tab(
                icon: Icon(Icons.add_call),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            listview(),
            Center(
              child: Text("Tidak Ada Status"),
            ),
            Center(
              child: Text("Tidak ada log panggilan"),
            ),
          ],
        ),
      ),
    );
  }
}
