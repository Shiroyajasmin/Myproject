import 'package:demo_sqflite/Model.dart';
import 'package:demo_sqflite/insertpage.dart';
import 'package:demo_sqflite/updatepage.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  Database? db;
  List<Map> l = [];

  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // READ  :SELECT
    Model().createDatabase().then((value) {
      db = value;

      String qry = "select * from contactbook";
      db!.rawQuery(qry).then((value1) {
        l = value1;
        print(l);

        setState(() {
          status = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Contact"),
      ),
      body: status
          ? (l.length > 0
              ? ListView.builder(
                  itemCount: l.length,
                  itemBuilder: (context, index) {
                    Map map = l[index];
                    String name = map['name'];
                    String contact = map['contact'];

                    int id = map['id'];

                    return ListTile(
                      title: Text("${name}"),
                      subtitle: Text("${contact}"),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              title: Text("Select Choice"),
                              children: [
                                ListTile(
                                  title: Text("Update"),
                                  onTap: () {
                                    Navigator.pop(context);

                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return updatepage(map);
                                          },
                                        ));

                                  },
                                ),
                                ListTile(
                                  title: Text("Delete"),
                                  onTap: () {

                                    Navigator.pop(context);

                                    String qry =
                                        "delete from contactbook where id='$id'";
                                    db!.rawDelete(qry).then((value) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return viewpage();
                                        },
                                      ));
                                    });
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                )
              : Center(child: Text("No data found")))
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return insertpage();
              },
            ));
          },
          child: Icon(Icons.add)),
    );
  }
}
