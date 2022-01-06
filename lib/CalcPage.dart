import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class STLTest extends StatefulWidget {
  @override
  _STLTestState createState() => _STLTestState();
}

class _STLTestState extends State<STLTest> {
  TextEditingController controllerO1 = TextEditingController();
  TextEditingController controllerO2 = TextEditingController();
  int? _value;
  String? _operand;
  List<Widget> resultsList = [];
  int dataCounter = 0;

  void calculateAndAppend() {
    try {
      double? resultss;
      if (_value == 1) {
        // + OPERAND
        resultss =
            double.parse(controllerO1.text) + double.parse(controllerO2.text);
        _operand = "+";
      } else if (_value == 2) {
        // - OPERAND
        resultss =
            double.parse(controllerO1.text) - double.parse(controllerO2.text);
        _operand = "-";
      } else if (_value == 3) {
        // * OPERAND
        resultss =
            double.parse(controllerO1.text) * double.parse(controllerO2.text);
        _operand = "*";
      } else if (_value == 4) {
        // / OPERAND
        resultss =
            double.parse(controllerO1.text) / double.parse(controllerO2.text);
        _operand = "/";
      } else if (_value == null) {
        throw FormatException();
      }
      setState(() {
        resultsList.add(Text(
            "Hasil dari ${controllerO1.text} ${_operand} ${controllerO2.text} adalah ${resultss}"));
      });
      dataCounter++;
    } on FormatException {
      setState(() {
        resultsList.add(Text("Input angka salah atau lupa memasukkan operator, tolong dicek baik-baik"));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flutter Exercises")),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blueAccent, width: 1.7)),
              child: TextField(
                decoration: InputDecoration(hintText: 'Operand 1'),
                controller: controllerO1,
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blueAccent, width: 1.7)),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Operand 2'),
                  controller: controllerO2,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("OPERATOR : "),
                DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(child: Text("+"), value: 1),
                    DropdownMenuItem(child: Text("-"), value: 2),
                    DropdownMenuItem(child: Text("*"), value: 3),
                    DropdownMenuItem(child: Text("/"), value: 4)
                  ],
                  onChanged: (int? values) {
                    setState(() {
                      _value = values;
                    });
                  },
                  hint: Text("+ or - or * or /"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: calculateAndAppend,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 115, 115)),
                  ),
                  child: Text("CALCULATE & ADD DATA"),
                ),
                ElevatedButton(
                    onPressed: () {
                      dataCounter--;
                      setState(() {
                        resultsList.removeLast();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 0, 115, 115)),
                    ),
                    child: Text("DELETE RECENT DATA"))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: resultsList,
              )
            )
          ],
        )
    );
  }
}
