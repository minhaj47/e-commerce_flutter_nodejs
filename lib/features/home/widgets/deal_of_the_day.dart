import 'package:flutter/material.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1525513688408-aef73a11a340?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$ 900',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 3, right: 40),
          alignment: Alignment.topLeft,
          child: const Text(
            'Macbook pro gen 2 m3 chip a23454543',
            // style: TextStyle(fontSize: 10),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1521661978458-5a2bec6b6e09?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8',
                fit: BoxFit.fitHeight,
                height: 80,
                width: 80,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1521661978458-5a2bec6b6e09?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8',
                fit: BoxFit.fitHeight,
                height: 80,
                width: 80,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1521661978458-5a2bec6b6e09?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8',
                fit: BoxFit.fitHeight,
                height: 80,
                width: 80,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1521661978458-5a2bec6b6e09?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8',
                fit: BoxFit.fitHeight,
                height: 80,
                width: 80,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1521661978458-5a2bec6b6e09?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8',
                fit: BoxFit.fitHeight,
                height: 80,
                width: 80,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10).copyWith(
            left: 25,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            'See all the deals',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        )
      ],
    );
  }
}
