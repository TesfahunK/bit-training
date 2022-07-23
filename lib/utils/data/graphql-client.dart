import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  'https://rickandmortyapi.com/graphql',
);

final HttpLink todoHttpLink = HttpLink(
  'https://zefagn-ql.hasura.app/v1/graphql',
);

ValueNotifier<GraphQLClient> graphqlClient = ValueNotifier(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: HiveStore()),
  ),
);

final todographClient = GraphQLClient(
  link: todoHttpLink,
  cache: GraphQLCache(store: HiveStore()),
);
