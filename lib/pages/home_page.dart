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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places app'),
      ),
      // make a Listview
      body: placeCard(places[0]),
    );
  }

  Widget placeCard(Place place) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            place.images[0],
          ),
          title: Text(place.name),
          subtitle: Text('price: ${place.price} - rating: ${place.rating}'),
          //  navigate to the next page
          onTap: () {
            print('go to next page');
          },
        ),
      ),
    );
  }
}
