import 'package:flutter/material.dart';

import '../models/place.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Place> places = [
    Place(
      id: 1,
      name: 'Kuwait Tower & Kuwait Scientific Center Tour',
      images: [
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/75/96/8a.jpg',
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/10/bf.jpg',
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/10/c0.jpg',
      ],
      price: 22.5,
      rating: 4.5,
    ),
    Place(
      id: 2,
      name: 'Kuwait Grand Mosque',
      images: [
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/90/79/c3.jpg',
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/f3/d1.jpg',
      ],
      price: 0,
      rating: 4.8,
    ),
    Place(
      id: 3,
      name: 'Al-Shaheed Park & Sheikh Jaber Al-Ahmad Cultural Centre Tour',
      images: [
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/fc/ef.jpg',
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/ed/fc/f5.jpg',
      ],
      price: 22.5,
      rating: 4.9,
    ),
    Place(
      id: 4,
      name: 'Kuwait Airport Two Way Private Transfers',
      images: [
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/75/96/92.jpg',
      ],
      price: 22.5,
      rating: 3.2,
    ),
    Place(
      id: 5,
      name: 'Souk Al-Mubarakiya',
      images: [
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/fe/87/6e/souk-al-mubarakiya.jpg?w=2000&h=-1&s=1',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/a1/f6/78/caption.jpg?w=900&h=-1&s=1',
      ],
      price: 12,
      rating: 4.0,
    ),
  ];

  bool showingList = true;

  void toggleLiked(int id) {
    for (var i = 0; i < places.length; i++) {
      if (places[i].id == id) {
        setState(() {
          places[i].isLiked = !places[i].isLiked;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      // make it listview
      body: placeCard(places[0]),

      // bottomNavigationBar: ,
    );
  }

  Padding placeCard(Place place) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: Image.network(
            place.images[0],
          ),
          title: Text(place.name),
          subtitle: Text('price: ${place.price} - rating: ${place.rating}'),
          trailing: IconButton(
            onPressed: () {
              int id = place.id;
              toggleLiked(id);
            },
            icon: Icon(
              place.isLiked == true ? Icons.favorite : Icons.favorite_border,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              showingList = !showingList;
            });
          },
          icon: Icon(
            showingList ? Icons.list : Icons.grid_view_rounded,
          ),
        )
      ],
    );
  }
}
