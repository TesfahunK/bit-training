import 'package:bit_initial/data/models/location.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final LocationMini location;
  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10)),
          height: 40,
          width: 40,
          child: Center(
              child: Icon(
            Icons.location_on,
            size: 20,
            color: Color(0xff1a237e),
          ))),
      title: Text(
        location.name,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(location.dimension),
      trailing: Icon(Icons.rocket_launch),
    );
  }
}
