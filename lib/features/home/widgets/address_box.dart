import 'package:ecommerce_app_flutter_nodejs/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.secondaryContainer,
          Theme.of(context).colorScheme.primaryContainer,
        ], stops: const [
          0.5,
          1.0
        ]),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              'Delivery to ${user.name} - ${user.address}',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5, top: 2),
            child: Icon(Icons.arrow_drop_down_outlined),
          ),
        ],
      ),
    );
  }
}
