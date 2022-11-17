import 'package:demo_sqflite/Model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  int? cnt;


  bool status = false;

  @override
  void initState() {
    super.initState();
    initPref();
  }

  initPref() async {
    Model.prefs = await SharedPreferences.getInstance();
    cnt = Model.prefs!.getInt("abc") ?? 0;
    status = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: status
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$cnt"),
                ElevatedButton(
                    onPressed: () async {
                      cnt = (cnt! + 1);

                      await Model.prefs!.setInt("abc", cnt!);
                      setState(() {});
                    },
                    child: Text("Increment")),
              ],
            )
          : Center(child: Text("Please Wait...")),
    );
  }
}
