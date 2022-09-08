import 'package:flutter/material.dart';
import 'package:listviewflutter/Api/KlasemenModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '';

class ListKlasemenFootball extends StatefulWidget {
  const ListKlasemenFootball({Key? key}) : super(key: key);

  @override
  State<ListKlasemenFootball> createState() => _ListKlasemenFootballState();
}

class _ListKlasemenFootballState extends State<ListKlasemenFootball> {

  KlasemenModel? klasemenModel;
  bool isLoading = true;


  void getAllListKlasemen() async {
    setState(() {
      isLoading = false;
    });
    final res = await http.get(Uri.parse("https://api-football-standings.azharimm.site/leagues/eng.1/standings?season=2022&sort=asc"));
    print("Response status: ${res.statusCode}");
    klasemenModel = KlasemenModel.fromJson(json.decode(res.body.toString()));
    print("team Klasemen 0 : " + klasemenModel!.data!.standings![0].team!.name.toString());
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListKlasemen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text("No", style: TextStyle(color: Colors.white, fontSize: 10),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text("Club", style: TextStyle(color: Colors.white, fontSize: 10),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text("W", style: TextStyle(color: Colors.white, fontSize: 10),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text("D", style: TextStyle(color: Colors.white, fontSize: 10),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text("L", style: TextStyle(color: Colors.white, fontSize: 10),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text("GD", style: TextStyle(color: Colors.white, fontSize: 10),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text("GA", style: TextStyle(color: Colors.white, fontSize: 10),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text("Pts", style: TextStyle(color: Colors.white, fontSize: 10),),
                      ),
                    ),
                  ),
                ],
              ),
                Container(
                  height: 428,
                  child: isLoading ? ListView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    itemCount: klasemenModel?.data?.standings?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print("team Klasemen : " + klasemenModel!.data!.standings![index].team!.name.toString());
                          print("team Klasemen : " + klasemenModel!.data!.standings![index].note!.rank.toString());
                        },
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(klasemenModel!.data!.standings![index].stats![8].value.toString(), style: TextStyle(color: Colors.white, fontSize: 10),),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Image.network(klasemenModel!.data!.standings![index].team!.logos![0].href.toString(), width: 15, height: 15,),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    //win
                                    child: Text(klasemenModel!.data!.standings![index].stats![0].value.toString(), style: TextStyle(color: Colors.white, fontSize: 10),),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    //draw
                                    child: Text(klasemenModel!.data!.standings![index].stats![2].value.toString(), style: TextStyle(color: Colors.white, fontSize: 10),),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    //lose
                                      child: Text(klasemenModel!.data!.standings![index].stats![1].value.toString(), style: TextStyle(color: Colors.white, fontSize: 10),)
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    //goal difference
                                    child: Text(klasemenModel!.data!.standings![index].stats![9].value.toString(), style: TextStyle(color: Colors.white, fontSize: 10),),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    //goal against
                                    child: Text(klasemenModel!.data!.standings![index].stats![5].value.toString(), style: TextStyle(color: Colors.white, fontSize: 10),),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey,
                                  child: Center(
                                    //point
                                    child: Text(klasemenModel!.data!.standings![index].stats![6].value.toString(), style: TextStyle(color: Colors.white, fontSize: 10),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      );
                    },
                  ) : Center(child: CircularProgressIndicator(),),
                ),
    ],
    ),
    ),
    ),
    );
  }
}
