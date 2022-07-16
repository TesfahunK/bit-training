import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffeceff1),
          Color(0xffeceff1).withOpacity(0.8),
          Color(0xffeceff1).withOpacity(0.6),
          Color(0xffeceff1).withOpacity(0.5),
          // Colors.white
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How to start investing uStock",
            style: TextStyle(
                color: Color(0xff37474f),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.blueGrey.withOpacity(0.5)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/happy-man-with-long-thick-ginger-beard-has-friendly-smile_273609-16616.jpg?w=1800")),
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)),
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/young-attractive-woman-smiling-feeling-healthy-hair-flying-wind_176420-37515.jpg?w=1800")),
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)),
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=1800")),
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)),
                height: 40,
                width: 40,
              ),
              Spacer(),
              Text(
                "Join Forum",
                style: TextStyle(fontSize: 12, color: Colors.purple),
              ),
              SizedBox(
                width: 3,
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.purple,
                size: 15,
              )
            ],
          )
        ],
      ),
    );
  }
}
