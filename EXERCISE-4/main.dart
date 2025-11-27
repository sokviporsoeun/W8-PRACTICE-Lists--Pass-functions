// 1. What type of data will store the jokes? 
// List of Maps (List<Map<String, String>>), the 'jokes' list from data/jokes.dart

// 2. What type of data will store the favorite joke? 
// int: stores the index of the favorite joke (_isFavIndex)

// 3. Which widget should be in charge of storing the favorite joke?  
// MyJoke widget it stores _isFavIndex which tracks which joke is the favorite

// 4. Which widget should be stateful?
// MyJoke should be stateful because it needs to remember which joke is favorited across rebuilds

// 5. How will your widget interact? 
// The child "FavoriteCard" calls a callback function "onFavoriteClick" when it was clicked so the parent updated the "_isFavIndex".

// 6. Do you need to pass callback function between widgets?
// YES, onFavorite callback is passed from MyJoke to FavoriteCard

import 'package:flutter/material.dart';
import 'data/jokes.dart';

Color appColor = Colors.green[300] as Color;

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const FavoriteCard({
    super.key, 
    required this.title, 
    required this.description,
    required this.isFavorite,
    required this.onFavorite,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),

                Text(description),
              ],
            ),
          ),
          IconButton(
              onPressed: onFavorite,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
class MyJoke extends StatefulWidget {
  const MyJoke({
    super.key,
  });

  @override
  State<MyJoke> createState() => _MyJokeState();
}

class _MyJokeState extends State<MyJoke> {
  int _isFavIndex = -1;

  void onFav(int index) {
    setState(() {
      _isFavIndex = index;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: jokes.map((joke) {
              int index = jokes.indexOf(joke);
              return FavoriteCard(
                title: joke['title']!,
                description: joke['description']!,
                isFavorite: _isFavIndex == index,
                onFavorite: () {
                  onFav(index);
                },
              );
            }).toList(),
          ),
        ),
      );
  }
}

void main() { 
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyJoke(),
    )
  );
}