import 'package:ecommerce_app_flutter_nodejs/features/home/widgets/address_box.dart';
import 'package:ecommerce_app_flutter_nodejs/features/home/widgets/carousel_image.dart';
import 'package:ecommerce_app_flutter_nodejs/features/home/widgets/catagory_list.dart';
import 'package:ecommerce_app_flutter_nodejs/features/home/widgets/deal_of_the_day.dart';
import 'package:ecommerce_app_flutter_nodejs/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 20),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(7),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search_outlined),
                        hintText: 'Search Amazon.in',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 15),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic),
              ),
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AddressBox(),
            SizedBox(height: 10),
            CategoryList(),
            // SizedBox(height: 10),
            CarouselImage(),
            DealOfTheDay(),
          ],
        ),
      ),
    );
  }
}
