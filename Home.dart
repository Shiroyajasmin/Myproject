import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();

  Model m = Get.put(Model());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          "Calculator using GetX",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Center(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                child: TextField(
                  controller: first,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 3)),
                    border: OutlineInputBorder(),
                    hintText: "Enter First",
                    labelText: "First",
                    labelStyle: TextStyle(color: Colors.teal),
                  ),
                ),
              )),
          Center(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                child: TextField(
                  controller: second,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 3)),
                    border: OutlineInputBorder(),
                    hintText: "Enter Second",
                    labelText: "Second",
                    labelStyle: TextStyle(color: Colors.teal),
                  ),
                ),
              )),
          Center(
            child: Container(
                margin: EdgeInsets.all(10),
                child: Obx(() => Text(
                  "Answer :  ${m.ans}",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {

                      String First = first.text;
                      String Second = second.text;

                      m.plus(First, Second);
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {

                      String First = first.text;
                      String Second = second.text;

                      m.minus(First, Second);
                    },
                    child: Text(
                      "-",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {

                      String First = first.text;
                      String Second = second.text;

                      m.multi(First, Second);
                    },
                    child: Text(
                      "*",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {

                      String First = first.text;
                      String Second = second.text;

                      m.div(First, Second);
                    },
                    child: Text(
                      "/",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class Model extends GetxController {

  RxDouble ans = 0.0.obs;

  void plus(
      String First,
      String Second,
      ) {
    double a = 0;
    double b = 0;

    if (First.trim().isNotEmpty) {
      a = double.parse(First);
    }
    if (Second.trim().isNotEmpty) {
      b = double.parse(Second);
    }

    double c = a + b;
    ans.value = c;
    print(ans);
  }

  void minus(String First, String Second) {
    double a = 0;
    double b = 0;

    if (First.trim().isNotEmpty) {
      a = double.parse(First);
    }
    if (Second.trim().isNotEmpty) {
      b = double.parse(Second);
    }

    double c = a - b;
    ans.value = c;
    print(ans);
  }

  void multi(String First, String Second) {
    double a = 0;
    double b = 0;

    if (First.trim().isNotEmpty) {
      a = double.parse(First);
    }
    if (Second.trim().isNotEmpty) {
      b = double.parse(Second);
    }

    double c = a * b;
    ans.value = c;
    print(ans);
  }

  void div(String First, String Second) {
    double a = 0;
    double b = 0;

    if (First.trim().isNotEmpty) {
      a = double.parse(First);
    }
    if (Second.trim().isNotEmpty) {
      b = double.parse(Second);
    }

    double c = a / b;
    ans.value = c;
    print(ans);
  }
}










