import 'package:flutter/material.dart';

import '../models/attraction.dart';
import '../api/all_attractions.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int crntTab = 0;
  bool isList = true;
  List<Attraction> attractions = AllAttractions.all;

  void toggleLiked(int id) {
    Attraction attraction = attractions.firstWhere((atr) => atr.id == id);
    setState(() {
      attraction.isLiked = !attraction.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isList = !isList;
                });
              },
              icon: Icon(
                isList ? Icons.list : Icons.grid_view_rounded,
              ))
        ],
      ),
      // bottomNavigationBar: myNavBar(),
      // body: selectTab(crntTab),
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.network(
                  attractions[i].images[0],
                  fit: BoxFit.cover,
                ),
                trailing: IconButton(
                  onPressed: () {
                    int id = attractions[i].id;
                    toggleLiked(id);
                  },
                  icon: Icon(
                    attractions[i].isLiked == true ? Icons.favorite : Icons.favorite_border,
                    color: Colors.pink,
                  ),
                ),
                title: Text(attractions[i].name),
                subtitle: Text('price: ${attractions[i].price} - rating: ${attractions[i].rating}'),
              ),
            ),
          );
        },
      ),
    );
  }

  // selectTab(int i) {
  //   List filtterdList;
  //   if (i == 0) {
  //     filtterdList = attractions;
  //   } else {
  //     filtterdList = attractions.where((atr) {
  //       return atr.isLiked == true;
  //     }).toList();
  //   }

  //   return ListView.builder(
  //     itemCount: filtterdList.length,
  //     itemBuilder: (BuildContext context, int i) {
  //       return Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Card(
  //           child: ListTile(
  //             leading: Image.network(
  //               filtterdList[i].images[0],
  //               fit: BoxFit.cover,
  //             ),
  //             trailing: IconButton(
  //               onPressed: () {
  //                 int id = filtterdList[i].id;
  //                 toggleLiked(id);
  //               },
  //               icon: Icon(
  //                 filtterdList[i].isLiked == true ? Icons.favorite : Icons.favorite_border,
  //                 color: Colors.pink,
  //               ),
  //             ),
  //             title: Text(filtterdList[i].name),
  //             subtitle: Text('price: ${filtterdList[i].price} - rating: ${filtterdList[i].rating}'),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // BottomNavigationBar myNavBar() {
  //   return BottomNavigationBar(
  //     currentIndex: crntTab,
  //     onTap: (value) {
  //       setState(() {
  //         crntTab = value;
  //         //go to page
  //       });
  //     },
  //     items: [
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.explore),
  //         label: 'explore',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.favorite),
  //         label: 'Saved',
  //       ),
  //     ],
  //   );
  // }
}
