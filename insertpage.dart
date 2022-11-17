import 'package:demo_sqflite/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'Model.dart';

class insertpage extends StatefulWidget {
  const insertpage({Key? key}) : super(key: key);

  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {
  TextEditingController tname = TextEditingController();
  TextEditingController tcontact = TextEditingController();

  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Model().createDatabase().then((value) {
      db = value;
    });
  }

  Future<bool> goback()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return viewpage();
      },
    ));
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        title: Text("Create Contact"),
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return viewpage();
            },
          ));
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tname,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tcontact,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                String name = tname.text;
                String contact = tcontact.text;


                String qry =
                    "insert into contactbook (name,contact) values ('$name','$contact')";
                db!.rawInsert(qry).then((value) {
                  print(value);

                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return viewpage();
                    },
                  ));
                });
              },
              child: Text("Save"))
        ],
      ),
    ), onWillPop: goback);
  }
}
