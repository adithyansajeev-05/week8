import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FavoritePage());
  }
}

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Map<String, dynamic>> items = [
    {"name": "Football", "isFavorite": false},

    {"name": "Cricket", "isFavorite": false},

    {"name": "Basketball", "isFavorite": false},

    {"name": "Tennis", "isFavorite": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Favorite Items", style: TextStyle(color: Colors.white)),
      ),

      body: ListView.builder(
        itemCount: items.length,

        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black, // background color

              border: Border.all(
                color: Colors.white, // border color
                width: 0.9,
              ),

              borderRadius: BorderRadius.circular(12),
            ),

            child: ListTile(
              title: Text(
                items[index]["name"],
                style: TextStyle(color: Colors.white),
              ),

              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    items[index]["isFavorite"] = !items[index]["isFavorite"];
                  });
                },

                icon: Icon(
                  items[index]["isFavorite"]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: items[index]["isFavorite"] ? Colors.red : Colors.white,
                ),
              ),
            ),
          ); //this logic not fails only for the  list is-
        }, //global,but when the UI is not rebulded.
      ),
    );
  }
}
