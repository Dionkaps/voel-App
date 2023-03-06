import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  
  bool isEnabled = true;
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tfPadding = 50.0;

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false, // Hides the back arrow button
        title: const Text('Magic Page'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: tfPadding),
              child: SizedBox(
                width: screenWidth * 0.7,
                child: TextField(
                  enabled: isEnabled,
                  decoration: InputDecoration(
                    hintText: "Person1",
                    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
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
              child: ElevatedButton(
                child: const Text('GO'),
                onPressed: () {
                  setState(() {
                    isEnabled = false;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: tfPadding),
              child: SizedBox(
                width: screenWidth * 0.7,
                child: TextField(
                  enabled: isEnabled,
                  decoration: InputDecoration(
                    hintText: "Person1",
                    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
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
          ]),
    );
  }
}
