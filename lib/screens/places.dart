import 'package:favorite_place/models/place.dart';
import 'package:favorite_place/providers/user_places.dart';
import 'package:favorite_place/screens/new_place.dart';
import 'package:favorite_place/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Place> places = [
  Place(name: "Home"),
  Place(name: 'Cafe')
];

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your places", style: Theme.of(context).textTheme.titleLarge,),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewPlace()));
          }, icon: const Icon(Icons.add)),
        ],
      ),
      body: PlacesList(places: userPlaces,)
    );
  }
}