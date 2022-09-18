import 'package:flutter/material.dart';
import 'package:match/Model/match_data/match_api_data.dart';

class Overview extends StatefulWidget {
  String mylink = '';
  Overview({super.key, required this.mylink});

  @override
  State<Overview> createState() => _OverviewState(mylink);
}

class _OverviewState extends State<Overview> {
  String mylink = '';
  _OverviewState(this.mylink);

  @override
  Widget build(BuildContext context) {
    ApiMatchData fetchApi = ApiMatchData();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: fetchApi.getMatchData(mylink),
          initialData: [],
          builder: (context, snapshot) {
            List? mydata = snapshot.data ?? [];
            if (!mydata.isEmpty) {
              return Container(
                height: double.infinity,
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: mydata.length,
                    itemBuilder: ((context, index) {
                      var data = mydata[index];

                      List<dynamic> teamAgolas = data.teamA.golas ?? [];
                      List<dynamic> teamBgolas = data.teamB.golas ?? [];

                      return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("${data.league}"),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Text("${data.time}"),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Image.network(
                                              data.teamA.img,
                                              width: 30,
                                              height: 30,
                                              cacheWidth: 30,
                                              cacheHeight: 30,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(data.teamA.name),
                                            const SizedBox(height: 10),
                                            // Text('${teamAgolas}'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(data.teamA.result,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15)),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8,
                                                          right: 8,
                                                          left: 8,
                                                          bottom: 3),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        data.status == 'مباشر'
                                                            ? Colors.red
                                                            : Colors.black12,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                  child: Text(
                                                    data.status,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          data.status == 'مباشر'
                                                              ? Colors.white
                                                              : Colors.black,
                                                    ),
                                                  )),
                                              Text(data.teamB.result,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Image.network(
                                              data.teamB.img,
                                              width: 30,
                                              height: 30,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(data.teamB.name),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: 15),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          for (var item in teamAgolas)
                                            Column(
                                              children: [
                                                Text(
                                                  item,
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ),
                                                SizedBox(height: 5),
                                              ],
                                            ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          for (var item2 in teamBgolas)
                                            Column(
                                              children: [
                                                Text(
                                                  item2,
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]);
                    })),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
