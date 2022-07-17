import 'package:bit_initial/data/models/episode.dart';
import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeMini episode;
  const EpisodeCard({Key? key, required this.episode}) : super(key: key);

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
            Icons.movie,
            size: 20,
            color: Color(0xff1a237e),
          ))),
      title: Text(
        episode.name,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(episode.air_date),
      trailing: Text(episode.episode),
    );
  }
}
