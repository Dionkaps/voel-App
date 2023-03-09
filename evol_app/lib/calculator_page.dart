import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalcPage extends StatefulWidget {
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool isEnabled = true;
  bool state2 = true;
  double percentageValue = 0;
  String resultValue = '';

  @override
  Widget build(BuildContext context) {
    Future<void> apiRes(name1, name2) async {
      final headers = {
        'X-RapidAPI-Key': '38e6466c77mshca67ff4a6f2b640p191cdfjsn63ace31c29a8',
        'X-RapidAPI-Host': 'love-calculator.p.rapidapi.com'
      };
      final response = await http.get(
          Uri.parse(
              'https://love-calculator.p.rapidapi.com/getPercentage?sname=$name1&fname=$name2'),
          headers: headers);

      if (response.statusCode == 200) {
        //The status code 200 means the request has succeeded
        final Map<String, dynamic> data = json.decode(response.body);
        final percentage = data['percentage'];
        final result = data['result'];

        print(percentage + result);

        setState(() {
          percentageValue = double.parse(percentage);
          resultValue = result.toString();
        });
      } else {
        throw Exception('Failed to load data');
        // Handle the error
      }
    }

    void toggleWidgets() {
      state2 = !state2;
    }

    Widget buttonGo = ElevatedButton(
      child: const Text('GO'),
      onPressed: () {
        String name1 = _controller1.text;
        String name2 = _controller2.text;
        apiRes(name1, name2);
        setState(() {
          toggleWidgets();
          isEnabled = false;
        });
      },
    );

    Widget percentage = Container(
      child: Text('$percentageValue% Match \n $resultValue',textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold),),
    );

    Widget restart = ElevatedButton(
      child: const Text('Calculate New'),
      onPressed: () {
        setState(() {
          state2 = !state2;
          isEnabled = true;
          _controller1.text = '';
          _controller2.text = '';
          percentageValue = 0;
        });
      },
    );

    Widget justText = Text("");

    double screenWidth = MediaQuery.of(context).size.width;
    double tfPadding = 50.0;
    Widget displayWidget = state2 ? buttonGo : percentage;
    Widget displayWidget1 = state2 ? justText : restart;

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: tfPadding),
                child: const Text(
                  "Insert the names you want to check",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: EdgeInsets.only(bottom: tfPadding),
              child: SizedBox(
                width: screenWidth * 0.7,
                child: TextField(
                  controller: _controller1,
                  enabled: isEnabled,
                  decoration: InputDecoration(
                    hintText: "Person1",
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: displayWidget,
            ),
            Padding(
              padding: EdgeInsets.only(top: tfPadding),
              child: SizedBox(
                width: screenWidth * 0.7,
                child: TextField(
                  controller: _controller2,
                  enabled: isEnabled,
                  decoration: InputDecoration(
                    hintText: "Person1",
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    filled: true,
                    fillColor: Colors.red.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: tfPadding),
              child: displayWidget1,
            )
          ]),
    );
  }
}
