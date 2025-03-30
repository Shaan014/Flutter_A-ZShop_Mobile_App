import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: const Color.fromARGB(255, 45, 44, 44),
      selectedItemColor: Colors.blue, // Highlight selected icon in blue
      unselectedItemColor:
          const Color.fromARGB(255, 248, 245, 245), // Other icons in grey
      showSelectedLabels: true, // Show labels
      showUnselectedLabels: true,

      // Set label text size
      selectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 17,
      ),

      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.store,
            size: 30,
          ),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            size: 30,
          ),
          label: 'Lists',
        ),
      ],
    );
  }
}
