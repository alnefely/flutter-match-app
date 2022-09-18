import 'package:flutter/material.dart';
import 'package:match/Model/matchs/get_api.dart';
import 'package:match/View/overview.dart';

class TodayMatch extends StatefulWidget {
  const TodayMatch({super.key});

  @override
  State<TodayMatch> createState() => _TodayMatchState();
}

class _TodayMatchState extends State<TodayMatch> {
  @override
  Widget build(BuildContext context) {
    GetApi fetchApi = GetApi();
    return FutureBuilder(
      future: fetchApi.getMatchs(),
      initialData: const [],
      builder: (context, snapshot) {
        List? matchs = snapshot.data;

        if (matchs!.isEmpty || matchs == null) {
          return const Center(
            child: CircularProgressIndicator(
                color: Colors.black45, backgroundColor: Colors.blue),
          );
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: matchs.length,
          itemBuilder: (context, index) {
            List items = matchs[index].leagues.matchs;
            return Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    "${matchs[index].leagues.name}",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                for (var data in items)
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Overview(mylink: data.link)));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.all(15),
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
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.network(
                                      data.teamAImg,
                                      width: 30,
                                      height: 30,
                                      cacheWidth: 30,
                                      cacheHeight: 30,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(data.teamAName),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(data.teamAResult,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 8,
                                              right: 10,
                                              left: 10,
                                              bottom: 3),
                                          decoration: BoxDecoration(
                                            color: data.status == 'مباشر'
                                                ? Colors.red
                                                : Colors.amberAccent,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          child: Text(
                                            data.status,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: data.status == 'مباشر'
                                                    ? Colors.white
                                                    : Colors.black),
                                          )),
                                      Text(data.teamBResult,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.network(
                                      data.teamBImg,
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(data.teamBName),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Text(data['stadium']),
                              Text(data.time),
                              Text(data.chanel),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 35),
              ],
            );
          },
        );
      },
    );
  }
}
