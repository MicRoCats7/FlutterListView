import 'package:flutter/material.dart';
import 'package:listviewflutter/PremiereLeagueModel.dart';

import 'package:google_fonts/google_fonts.dart';

class Detail extends StatefulWidget {
  Detail({Key? key, this.teams }) : super(key: key);
  Teams? teams;

  @override
  State<Detail> createState() => _DetailState();
}

Widget textView(String name, Color colors){
  return Container(
    child: Text(name, style: TextStyle(color: colors),),
  );
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
            backgroundColor: Color(0xff16213E),
          title: Text("Detail Club",style: TextStyle(color: Colors.white)),),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 20),
                      color: Colors.white60,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.network(widget.teams!.strTeamBadge.toString()),
                          ],
                        ),
                      ),
                    ),

                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.teams!.strTeam.toString(), style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                      child: Card(
                        color: Colors.white60,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Description : ", style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 15),),
                                SizedBox(height: 20,),
                                Text(widget.teams!.strDescriptionEN.toString()),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.teams!.strStadium.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.teams!.strStadiumThumb.toString()),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
