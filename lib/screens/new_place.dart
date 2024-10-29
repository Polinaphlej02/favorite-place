import 'package:favorite_place/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _titleController = TextEditingController();

  void _savePlaces() {
    final enteredText = _titleController.text;
    if (enteredText == null || enteredText.isEmpty) {
      return;
    }
  ref.read(userPlacesProvider.notifier).addPlace(enteredText);

  Navigator.of(context).pop();

  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New place", style: Theme.of(context).textTheme.titleLarge,),
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
        children: [
            TextField(
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(height: 8,),
          ElevatedButton(
            onPressed: _savePlaces,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add),
                Text("Add Place"),
              ],
            ),
          )
        ],
    )),
    );
  }
}