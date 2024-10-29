import 'package:flutter/material.dart';

class NewPlace extends StatelessWidget {
  const NewPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New place", style: Theme.of(context).textTheme.titleLarge,),
      ),
      body:Form(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: TextFormField(
              key: ValueKey('value'),
            ),
          ),
          SizedBox(height: 8,),
          ElevatedButton(
            onPressed: () {},
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add),
                Text("Add Place"),
              ],
            ),
            ),
        ],
      )),
    );
  }
}