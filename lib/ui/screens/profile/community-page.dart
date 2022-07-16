import 'package:bit_initial/ui/widgets/community-card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Text(
            "Learn Stock,\nEducate the World",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromRGBO(4, 7, 32, 1)),
          )),
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                color: Color(0xffeeeeee),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                runSpacing: 5,
                children: [
                  Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                  Text(
                    "Search Something...",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ))

          // TODO : finish list items

          ,
          CommunityCard(),
          CommunityCard(),
          CommunityCard(),
        ],
      )),
    );
  }
}
