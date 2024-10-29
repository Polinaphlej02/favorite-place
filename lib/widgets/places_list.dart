import 'package:favorite_place/screens/place_details.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {

    if (places.isEmpty) {
      return Center(child: Text("No places added yet", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          ),));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(places[index].name, style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.white,
          ),),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => PlaceDetailsScreen(place: places[index])));
          },
          );
      }),
    );
  }
}