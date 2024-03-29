import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_brain_games/Login/auth_service.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/pointsmodel.dart';
import 'package:sih_brain_games/main.dart';
import 'package:sih_brain_games/profile/newprofile.dart';
import 'dart:math';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sih_brain_games/points_firebase.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;



  Widget displayscore(String s) {
    return RegularButton(onPressed: () {}, title: s);
    // return Container(
    //   child: ClipRRect(
    //     clipBehavior: Clip.hardEdge,
    //     borderRadius: BorderRadius.circular(25),
    //     child: Container(
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //               colors: [Colors.grey.shade800, Colors.grey.shade900]),
    //           //color: Colors.grey.shade700,
    //           borderRadius: BorderRadius.circular(25),
    //           border: Border.all(width: 2, color: Colors.cyan)),
    //       child: Text(
    //         s,
    //         style: TextStyle(fontSize: 20, color: Colors.white),
    //       ),
    //     ),
    //   ),
    // );
  }
  String selanime(int t)
  {
    if(t==1){
      return 'animations/1st.json';
    }
    else if(t==2)
      {
        return 'animations/2nd.json';
      }
    else if(t==3)
    {
      return 'animations/3rd.json';
    }
    else if(t>=4)
      {
        return 'animations/4th.json';
      }
    else{
      return 'animations/0th.json';
    }
  }
  String seltext(int t)
  {
    if(t==1){
      return 'Help the eggs hatch by reaching 1000 points';
    }
    else if(t==2)
    {
      return 'Hurray you Hatched the egg now help the chick by reaching 1500 points';
    }
    else if(t==3)
    {
      return 'Now help the chick grow by reaching 2000 points';
    }
    else if(t>=4)
    {
      return 'Now you have a grown Chicken going to work';
    }
    else{
      return 'Help the chicken lay eggs by reaching 500 points';
    }
  }


  Text medals(double b) {
    if (b <= 0.5) {
      return const Text("🥉",style: TextStyle(
        color: Colors.brown,
          fontSize: 25
      ),);
    } else if (b > 0.6 && b <= .8) {
      return const Text("🥈",style: TextStyle(
        color: Colors.grey,
          fontSize: 25
      ),);
    } else {
      return const Text("🥇",style: TextStyle(
        color: Colors.grey,
          fontSize: 25
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
     double total=0;
    pointsmodel p = box.get('points');
    denominatormodel d = box1.get('d');
    usernamemodel u = box2.get('u');
    final _auth = AuthService();
    final List<ChartData> chartData = [
      ChartData(0, p.p1 / d.d1),
      ChartData(1, p.p2 / d.d2),
      ChartData(2, p.p3 / d.d3),
      ChartData(3, p.p4 / d.d4),
      ChartData(4, p.p5 / d.d5),
      ChartData(5, p.p6 / d.d6),
    ];
    final List<ChartData> chartData1 = [
      ChartData(1, 0.6),
      ChartData(2, 0.75),
      ChartData(3, 0.82),
      ChartData(4, 0.62),
      ChartData(5, 0.75),
      ChartData(6, 0.43),
    ];
    var name = auth.currentUser?.email;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color(0xff6053BC),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 17,
              ),
              GestureDetector(
                onTap: (){

                },
                child: CircleAvatar(
                  radius: 56,
                  backgroundImage: AssetImage('assets/img.png'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                u.username,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Lottie.asset(
                selanime((p.p1+p.p2+p.p3+p.p4+p.p5+p.p6)~/500),
                width: 200,
                height: 200,
                repeat: true,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  seltext((p.p1+p.p2+p.p3+p.p4+p.p5+p.p6)~/500),
                  style: const TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ),
              /*RadarChart(
                radius: 150, length: 6, initialAngle: pi / 3,
                //backgroundColor: Colors.white,
                //borderStroke: 2,
                borderColor: Colors.deepPurpleAccent.withOpacity(0.4),
                radialStroke: 2,
                radialColor: Colors.grey.shade600,
                radars: [
                  RadarTile(
                    values: values1,
                    borderStroke: 2,
                    borderColor: Colors.green,
                    backgroundColor: Colors.green.withOpacity(0.6),
                  ),
                ],
              ),*/
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Game data",
                  style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(name: "abc",labelStyle: TextStyle(color: Colors.white)),
                  primaryYAxis: NumericAxis(name: "",labelStyle: TextStyle(color: Colors.white)),
                  series: <ChartSeries<ChartData, int>>[
                    // Renders column chart
                    ColumnSeries<ChartData, int>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      enableTooltip: true,
                      width: 0.5,
                      spacing: 0.2,
                      xAxisName: " ",
                      color: Colors.amber,
                    )
                  ]),
              Center(
                child: Text(
                  "Monthly Score",
                  style: const TextStyle(fontSize: 24,color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                      labelPosition: ChartDataLabelPosition.inside,
                      tickPosition: TickPosition.inside,
                      labelStyle: TextStyle(color: Colors.white)
                  ),
                primaryYAxis: NumericAxis(name: "",labelStyle: TextStyle(color: Colors.white)),
                series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<ChartData, int>(
                      dataSource: chartData1,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    color: Colors.amber
                  )
                ],
                // Renders column chart

              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Pair Game  ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                  medals(p.p1/d.d1),
                  Text("${(p.p1).toInt()}",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Memory Game  ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                  medals(p.p2/d.d2),
                  Text("${(p.p2).toInt()}",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Puzzle Game  ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                  medals(p.p3/d.d3),
                  Text("${(p.p3).toInt()}",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Speed Game  ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                  medals(p.p4/d.d4),
                  Text("${(p.p4).toInt()}",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Math Game  ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                  medals(p.p5/d.d5),
                  Text("${(p.p5).toInt()}",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Word Game  ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                  medals(p.p6/d.d6),
                  Text("${(p.p6).toInt()}",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                child: ListTile(
                  tileColor: Colors.white,
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  title: Center(
                    child: Text(
                      "Sign Out",
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    _auth.signOut();
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text("debug options",style: TextStyle(
                  color: Colors.white,
                  fontSize: 15),
              ),
              ElevatedButton(
                  onPressed: () {
                    box.put(
                        'points',
                        pointsmodel(
                          p1: p.p1+50,
                          p2: p.p2+70,
                          p3: p.p3+35,
                          p4: p.p4+40,
                          p5: p.p5+80,
                          p6: p.p6+70,
                        ));
                    box1.put(
                        'd',
                        denominatormodel(
                            d1: d.d1+100,
                            d2: d.d2+100,
                            d3: d.d3+100,
                            d4: d.d4+100,
                            d5: d.d5+100,
                            d6: d.d6+100));
                    setState(() {
                      p = box.get('points');
                      d = box1.get('d');
                    });
                  },
                  child: const Text("Set Points")),
              ElevatedButton(
                  onPressed: () {
                    box.put(
                        'points',
                        pointsmodel(
                          p1: 0,
                          p2: 0,
                          p3: 0,
                          p4: 0,
                          p5: 0,
                          p6: 0,
                        ));
                    box1.put(
                        'd',
                        denominatormodel(
                            d1: 0.1,
                            d2: 0.1,
                            d3: 0.1,
                            d4: 0.1,
                            d5: 0.1,
                            d6: 0.1));
                    setState(() {
                      p = box.get('points');
                      d = box1.get('d');
                    });
                  },
                  child: const Text("Reset Points")),

            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
