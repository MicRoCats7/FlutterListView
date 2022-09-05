import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:listviewflutter/ClubList.dart';
import 'package:listviewflutter/DetailFootBall.dart';
import 'package:listviewflutter/PremiereLeagueModel.dart';


class ListAllFootbal extends StatefulWidget {
  const ListAllFootbal({Key? key}) : super(key: key);

  @override
  State<ListAllFootbal> createState() => _ListAllFootbalState();
}

class _ListAllFootbalState extends State<ListAllFootbal> with SingleTickerProviderStateMixin  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 250,
              child: FittedBox(
                child: Image.asset("assets/banner-listView.png"),
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Image.asset("assets/logo-removebg-preview.png", scale: 4,),
                      Column(
                        children: [
                          Text(
                            "Premier League",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          Text(
                            "Club",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Expanded(
          child: Container(
            child: Column(
              children: <Widget>[
                DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                      Container(
                        child: TabBar(
                          indicatorColor: Colors.green,
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Club'),
                            Tab(text: 'Klasemen'),
                          ],
                        ),
                      ),
                      Container(
                          height: 538.70, //height of TabBarView
                          child: TabBarView(children: <Widget>[
                           ClubList(),
                            Container(
                              child: Center(
                                child: Text('Display Tab Klasemen', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ])
                      )
                    ])
                ),
              ]),
            ),
        ),
      ],
    ),
    );
  }
}
