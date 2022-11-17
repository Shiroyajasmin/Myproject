import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: demofuturebuilder(),
  ));
}

class demofuturebuilder extends StatefulWidget {
  const demofuturebuilder({Key? key}) : super(key: key);

  @override
  State<demofuturebuilder> createState() => _demofuturebuilderState();
}

class _demofuturebuilderState extends State<demofuturebuilder> {

  Future<List> getAllMovies() async {
    await Future.delayed(Duration(seconds: 4));

    List l = ["Movie 1", "Movie 2", "Movie 3", "Movie 4"];

    return l;
  }

  Future<List> getAllWebseries() async {
    await Future.delayed(Duration(seconds: 8));

    List l = ["Season 1", "Season 2", "Season 3", "Season 4"];

    return l;
  }

  getAllChannles() async {
    await Future.delayed(Duration(seconds: 3));

    List l = ["Season 1", "Season 2", "Season 3", "Season 4"];


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: FutureBuilder(
              future: getAllMovies(),
              builder: (context, snapshot) {

                if(snapshot.connectionState==ConnectionState.done)
                {
                  if(snapshot.hasData)
                  {

                    List? l = snapshot.data;

                    return ListView.builder(scrollDirection: Axis.horizontal,itemCount: l!.length,itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.black26,
                        margin: EdgeInsets.all(10),
                        child: Text("${l[index]}"),
                      );
                    },);
                  }
                  else if (snapshot.hasError){
                    return Text("No data found");
                  }
                  else
                  {
                    return Text("No data found");
                  }
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Container(
            height: 100,
            child: FutureBuilder(
              future: getAllWebseries(),
              builder: (context, snapshot) {

                if(snapshot.connectionState==ConnectionState.done)
                {
                  if(snapshot.hasData)
                  {

                    List? l = snapshot.data;

                    return ListView.builder(scrollDirection: Axis.horizontal,itemCount: l!.length,itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.black26,
                        margin: EdgeInsets.all(10),
                        child: Text("${l[index]}"),
                      );
                    },);
                  }
                  else if (snapshot.hasError){
                    return Text("No data found");
                  }
                  else
                  {
                    return Text("No data found");
                  }
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Container(
            height: 100,
            child: FutureBuilder(
              future: getAllChannles(),
              builder: (context, snapshot) {

                if(snapshot.connectionState==ConnectionState.done)
                {
                  if(snapshot.hasData)
                  {

                    List? l = snapshot.data as List;

                    return ListView.builder(scrollDirection: Axis.horizontal,itemCount: l!.length,itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.black26,
                        margin: EdgeInsets.all(10),
                        child: Text("${l[index]}"),
                      );
                    },);
                  }
                  else if (snapshot.hasError){
                    return Text("No data found");
                  }
                  else
                  {
                    return Text("No data found");
                  }
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}
