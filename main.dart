import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List l = List.filled(9, "");
  int cnt = 0, cnt1 = 0 , cnt2 = 0;
  String p1 = "X";
  String p2 = "O";
  String msg = "Game is Running";
  int w = 0;
  int s1 = 0;

  Widget mybutton(int i) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (l[i] == "" && w == 0) {
            if (cnt % 2 == 0) {
              l[i] = p1;
            } else {
              l[i] = p2;
            }
            cnt++;
            win();
            setState(() {});
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: l[i] == ""
                  ? Colors.black
                  : (l[i] == p1 ? Colors.red : Colors.cyan)),
          margin: EdgeInsets.all(5),
          child: Text(
            l[i],
            style: TextStyle(
                fontSize: 55, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  win() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1)) {
      msg = "$p1 is Winner";
      cnt1++;
      s1 = 1;
      w = 1;
    } else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2)) {
      msg = "$p2 is Winner";
      cnt2++;
      s1 = 2;
      w = 1;
    } else if (cnt == 9) {
      msg = "Game is Draw";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        backgroundColor: Colors.black,
        title: Text("Tic Tac Toe",
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.black),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text("Player 1",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.black),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text("$cnt1   -   $cnt2",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.black),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text("Player 2",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: s1 == 0 ? Colors.black : (s1 == 1 ? Colors.red : Colors.cyan )),
            margin: EdgeInsets.all(30),
            child: Text(
              msg,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
              child: Row(
                children: [
                  mybutton(0),
                  mybutton(1),
                  mybutton(2),
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  mybutton(3),
                  mybutton(4),
                  mybutton(5),
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  mybutton(6),
                  mybutton(7),
                  mybutton(8),
                ],
              )),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(50),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    l = List.filled(9, "");
                    cnt = 0;
                    msg = "Game is Running";
                    w = 0;
                    s1 = 0;
                    setState(() {});
                  },icon: Icon(Icons.refresh_rounded),
                  label: Text("Reset",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 20),),
                ),
              ),

              Container(
                margin: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    l = List.filled(9, "");
                    cnt = 0;
                    msg = "Game is Running";
                    w = 0;
                    s1 = 0;
                    cnt1 = 0;
                    cnt2 = 0;
                    setState(() {});
                  },icon: Icon(Icons.power_settings_new),
                  label: Text("New Game",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 20),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}