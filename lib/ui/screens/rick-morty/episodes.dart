import 'package:bit_initial/data/models/episode.dart';
import 'package:bit_initial/ui/widgets/loader.dart';
import 'package:bit_initial/ui/widgets/rick-morty/episode-card.dart';
import 'package:bit_initial/utils/data/queries.dart';
import 'package:bit_initial/utils/ui/basic-widgets.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EpisodeListScreen extends StatelessWidget {
  const EpisodeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
          options: QueryOptions(document: episodes()),
          builder: (QueryResult result, {Refetch? refetch, fetchMore}) {
            if (result.isLoading) {
              return Center(child: Loader());
            } else if (result.hasException) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Something happened")
                  ],
                ),
              );
            } else {
              List<EpisodeMini> _data =
                  (result.data!['episodes']['results'] as List)
                      .map((e) => EpisodeMini.fromMap(e))
                      .toList();

              return _data.isEmpty
                  ? emptyList(icon: Icons.movie, msg: "No Episodes Yet!")
                  : RefreshIndicator(
                      onRefresh: () async => await refetch!(),
                      child: ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            var item = _data[index];
                            return EpisodeCard(
                              episode: item,
                            );
                          }),
                    );
            }
          }),
    );
  }
}
