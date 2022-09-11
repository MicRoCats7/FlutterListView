import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:listviewflutter/Api/DetailFootBall.dart';
import 'package:listviewflutter/PremiereLeagueModel.dart';
import 'package:http/http.dart' as http;


class ClubList extends StatefulWidget {
  const ClubList({Key? key}) : super(key: key);

  @override
  State<ClubList> createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {


  PremiereLeagueModel? premiereLeagueModel;
  bool isLoading = true;

  void getAllListSpanyol() async {
    setState(() {
      isLoading = false;
    });
    final res = await http.get(Uri.parse("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League`"));
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
    return isLoading ? Scaffold(
      backgroundColor: Color(0xFF222222),
      body: Center(
        child: isLoading? Container(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: premiereLeagueModel!.teams!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(teams: premiereLeagueModel!.teams![index])));
                  },
                  child: Card(
                    color: Color(0xFF353535),
                    margin: EdgeInsets.all(5),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child : FadeInImage.assetNetwork(
                              placeholder:  'assets/premierleague.png',
                              image: premiereLeagueModel!.teams![index].strTeamBadge.toString(), width: 50, height: 50,
                            ),
                          ),
                          // Image.network(premiereLeagueModel!.teams![index].strTeamBadge.toString() ?? "", width: 50, height: 50,),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(premiereLeagueModel!.teams![index].strTeam.toString() ?? "", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              );
            },
          ),
        ): CircularProgressIndicator(),
      ),
    ): CircularProgressIndicator();
  }

}