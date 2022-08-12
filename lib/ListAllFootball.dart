import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:listviewflutter/PremiereLeagueModel.dart';

class ListAllFottball extends StatefulWidget {
  const ListAllFottball({Key? key}) : super(key: key);

  @override
  State<ListAllFottball> createState() => _ListAllFottballState();
}

class _ListAllFottballState extends State<ListAllFottball> {
  PremiereLeagueModel? premiereLeagueModel;
  
void getAllListPL() async{
  final res = await http.get(
    Uri.parse(
      "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"),
  );
  print("Status code" + res.statusCode.toString());
  premiereLeagueModel =
      PremiereLeagueModel.fromJson(json.decode(res.body.toString()));
  print("Team 1 : "+premiereLeagueModel!.teams![1].strTeam.toString());
}  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
