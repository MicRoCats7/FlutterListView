import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:listviewflutter/DetailFootBall.dart';
import 'package:listviewflutter/PremiereLeagueModel.dart';


class ListAllFootbal extends StatefulWidget {
  const ListAllFootbal({Key? key}) : super(key: key);

  @override
  State<ListAllFootbal> createState() => _ListAllFootbalState();
}

class _ListAllFootbalState extends State<ListAllFootbal> {
  PremiereLeagueModel? premiereLeagueModel;
  bool isloaded = true;

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"),
    );
    print("status code " + res.statusCode.toString());
    premiereLeagueModel =
        PremiereLeagueModel.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + premiereLeagueModel!.teams![0].strTeam.toString());
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff16213E),
        title: Text("List Premiere League", style: TextStyle(color: Colors.white60),),
      ),
      body: Center(
        child: Container(
          child: isloaded
              ? ListView.builder(
              itemCount: premiereLeagueModel!.teams!.length,
              itemBuilder: (BuildContext context, int index) {
                String name = premiereLeagueModel!
                    .teams![index].strTeam
                    .toString();
                String stadium = premiereLeagueModel!
                    .teams![index].strStadium
                    .toString();
                return InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return Detail(teams: premiereLeagueModel!.teams![index],);
                   },));
                  },
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              width: 40,
                              height: 40,
                              child: Image.network(premiereLeagueModel!.teams![index].strTeamBadge.toString())),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name),
                              Text(stadium),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
