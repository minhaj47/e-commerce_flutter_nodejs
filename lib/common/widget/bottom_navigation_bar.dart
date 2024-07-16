import 'package:ecommerce_app_flutter_nodejs/features/home/screen/home_screen.dart';
import 'package:ecommerce_app_flutter_nodejs/features/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  final double bottomBarWidth = 42;
  final double bottomBarBorderWidth = 3;

  final List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const Center(child: Text('Cart'))
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Badge(
                label: Text('4'),
                backgroundColor: Colors.white,
                textColor: Colors.black,
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
