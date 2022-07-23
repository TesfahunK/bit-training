import 'package:bit_initial/data/models/character.dart';
import 'package:bit_initial/ui/widgets/loader.dart';
import 'package:bit_initial/ui/widgets/rick-morty/character-card.dart';
import 'package:bit_initial/utils/data/queries.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
          options: QueryOptions(document: characters()),
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
              List<CharacterModel> _data =
                  (result.data!['characters']['results'] as List)
                      .map((e) => CharacterModel.fromMap(e))
                      .toList();

              return _data.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.list),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Sorry No Characters Today :(")
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async => await refetch!(),
                      child: ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            var item = _data[index];
                            return CharacterCard(
                              character: item,
                            );
                          }),
                    );
            }
          }),
    );
  }
}
