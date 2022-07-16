import 'package:flutter/material.dart';

class FirstHomePage extends StatelessWidget {
  const FirstHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BIT Training"),
        ),
        body: Container(
            // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: ListView.builder(
                itemCount: 20,
                // scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.amber,
                    child: Text(" Item ${index + 1} "),
                  );
                })));
  }
}
