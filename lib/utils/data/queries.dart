import 'package:graphql_flutter/graphql_flutter.dart';

characters() => gql('''


query {

	characters {
			info {
			count
			pages
			next 
			prev
		}

		results {
      id
			name
			gender 
			image
			species
			status
			type
			

			location {
				name
				dimension
			}
			origin {
				name
				dimension
			}
		}
	}
}



''');

locations() => gql('''


query {
	locations {
			info {
			count
			pages
			next 
			prev
		}

		results {
    id
			name
			dimension
		}
	}
}


''');

episodes() => gql("""


query {
	episodes {
		info {
			count
			pages
			next 
			prev
		}

		results {
    id
			air_date
			name
			episode
		}
	}
}

""");
