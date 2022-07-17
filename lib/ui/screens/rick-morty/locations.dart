import 'package:bit_initial/data/models/location.dart';
import 'package:bit_initial/ui/widgets/loader.dart';
import 'package:bit_initial/ui/widgets/rick-morty/location-card.dart';
import 'package:bit_initial/utils/data/queries.dart';
import 'package:bit_initial/utils/ui/basic-widgets.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
          options: QueryOptions(document: locations()),
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
              List<LocationMini> _data =
                  (result.data!['locations']['results'] as List)
                      .map((e) => LocationMini.fromMap(e))
                      .toList();

              return _data.isEmpty
                  ? emptyList(icon: Icons.location_on, msg: "No Locations Yet!")
                  : RefreshIndicator(
                      onRefresh: () async => await refetch!(),
                      child: ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            var item = _data[index];
                            return LocationCard(
                              location: item,
                            );
                          }),
                    );
            }
          }),
    );
  }
}
