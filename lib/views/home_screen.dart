import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var result;

  Future<void> apiCall() async {
    final HttpLink httpLink = HttpLink(
      "https://graphql.postman-echo.com/graphql",
    );
    final GraphQLClient client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
    final QueryResult res = await client.query(
      QueryOptions(
        document: gql("""
        query Hello {
          hello(person: { name: "Devv" })
        }
      """),
      ),
    );
    setState(() {
      result = res;
    });
    print(result);
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("api info")),
      body: Center(
        child: result != null
            ? result.hasException
                  ? Text(result.exception.toString())
                  : Text(result.data["hello"])
            : SkeletonAnimation(
                shimmerDuration: 5,
                shimmerColor: Colors.black,
                gradientColor: Colors.red,
                child: SizedBox(width: 100),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          apiCall();
        },
      ),
    );
  }
}
