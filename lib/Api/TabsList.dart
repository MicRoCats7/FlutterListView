import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:listviewflutter/Api/ClubList.dart';
import 'package:listviewflutter/Api/DetailFootBall.dart';
import 'package:listviewflutter/Api/Favorite.dart';
import 'package:listviewflutter/Api/KlasemenList.dart';
import 'package:listviewflutter/PremiereLeagueModel.dart';


class ListAllFootbal extends StatefulWidget {
  const ListAllFootbal({Key? key}) : super(key: key);

  @override
  State<ListAllFootbal> createState() => _ListAllFootbalState();
}

class _ListAllFootbalState extends State<ListAllFootbal> with SingleTickerProviderStateMixin  {

  PremiereLeagueModel? premiereLeagueModel;
  bool isLoading = true;

  void getAllListSpanyol() async {
    setState(() {
      isLoading = false;
    });
    final res = await http.get(Uri.parse("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"));
    print("Response status: ${res.statusCode}");
    premiereLeagueModel = PremiereLeagueModel.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + premiereLeagueModel!.teams![0].strTeam.toString());
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListSpanyol();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F1052),
        title: Text("Premier League", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePremier()),);
          }, icon: Icon(Icons.favorite, color: Colors.red,),),
        ],
      ),
      body: isLoading? Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0),
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
            color: Color(0XFF3f1052),
            padding: EdgeInsets.only(top: 0),
            child: Card(
              margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
              color: Color(0XFF3f1052),
              child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 0),
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
                            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: 40,
                                      height: 40,
                                      child: Image.network(premiereLeagueModel!.teams![index].strTeamBadge.toString())),
                                  Container(
                                    child: Text(name, style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                    ),),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward, size: 17,color: Colors.black,),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
              ),),
          ),
        ),
      ],
    ): Center(child: CircularProgressIndicator()),
    );
  }
}
