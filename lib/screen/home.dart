import 'package:flutter/material.dart';

import 'mutation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //button to navigate to mutation screen
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Mutation(),
          ),
        );
      },
      child: const Text('Mutation'),
    );
  }
}