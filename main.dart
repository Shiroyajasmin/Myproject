import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: searchdemo(),
  ));
}

class searchdemo extends StatefulWidget {
  const searchdemo({Key? key}) : super(key: key);

  @override
  State<searchdemo> createState() => _searchdemoState();
}

class _searchdemoState extends State<searchdemo> {
  bool issearch = false;
  List l = [
    "Ajay",
    "Suresh",
    "Sanjay",
    "Vijay",
    "Mahesh",
    "Jagdish",
    "Dharmesh"
  ];

  List temp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    temp.addAll(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: issearch
          ? AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                issearch = false;
              });
            },
            icon: Icon(Icons.arrow_back)),
        title: TextField(
          autofocus: true,
          onChanged: (value) {

            //a
            temp.clear();

            for(int i=0;i<l.length;i++)
            {
              if(l[i].toString().toLowerCase().contains(value.trim().toLowerCase()))
              {
                temp.add(l[i]);
              }
            }

            setState(() {

            });

          },
        ),
      )
          : AppBar(
        title: Text("Whatsapp"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  issearch = true;
                });
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: issearch ? ListView.builder(
        itemCount: temp.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${temp[index]}"),
          );
        },
      ) : ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${l[index]}"),
          );
        },
      ),
    );
  }
}
