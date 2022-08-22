import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sih_brain_games/pointsmodel.dart';
import 'package:sih_brain_games/main.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  Widget displayscore(String s)
  {
    return Container(
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey.shade800, Colors.grey.shade900]),
              //color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 2, color: Colors.cyan)),
          child:
               Text(
                s,
                style: TextStyle(fontSize: 20, color: Colors.white),

              ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    pointsmodel p=box.get('points');
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                CircleAvatar(
                  radius: 56,
                  backgroundImage: AssetImage(
                    'assets/img.png'
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text("MyName",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                Text("MyName@gmail.com",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                  ),),
                SizedBox(
                  height: 12,
                ),
                displayscore("Memory ${p.p1}"),
                SizedBox(
                  height: 12,
                ),
                displayscore("Pair ${p.p2}"),
                SizedBox(
                  height: 12,
                ),
                displayscore("Speed ${p.p3}"),
                SizedBox(
                  height: 12,
                ),
                displayscore("Puzzle ${p.p4}"),
                SizedBox(
                  height: 12,
                ),
                displayscore("Math ${p.p4}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}