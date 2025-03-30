import 'package:flutter/material.dart';

import '../services/card_service.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/categories_bar.dart';
import '../widgets/custom_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;
  List<Map<String, String>> cardData = [];

  final List<String> categories = [
    'Explore',
    'Shops',
    'Latest',
    'A-Z',
    'Groceries',
    'Restaurant',
    'Pharmacy',
    'Electronics',
    'Baby & Kids'
  ];

  @override
  void initState() {
    super.initState();
    _fetchCardData();
  }

  void _fetchCardData() {
    final cardService = CardService();
    final fetchedData = cardService.getCards();

    if (fetchedData != null) {
      setState(() {
        cardData = fetchedData;
      });
    }
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.jpg'), // Logo
        ),
        title: const Text(
          'Online Store',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: const [
          Icon(Icons.settings, color: Colors.white), // Settings Icon
          SizedBox(width: 10),
        ],
        backgroundColor: const Color.fromARGB(255, 64, 67, 69),
      ),
      body: Container(
        color: const Color.fromARGB(255, 40, 39, 39),
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: 'Search deals and stores',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Horizontal Scrollable Categories Bar
              CategoriesBar(
                categories: categories,
                onCategorySelected: _onCategorySelected,
              ),
              const SizedBox(height: 15),

              // Grocery Image Poster Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/poster.jpg', // Grocery poster image
                        width: double.infinity,
                        height: 180, // Poster image height
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Big Sale On Now",
                      style: TextStyle(
                        fontSize: 20, // Text size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // White Separator Line
              Container(
                height: 2,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),

              // List of Cards
              cardData.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cardData.length,
                      itemBuilder: (context, index) {
                        return CustomCardWidget(
                          title: cardData[index]['title'] ?? 'No Title',
                          imagePath: cardData[index]['imagePath'] ??
                              'assets/default.jpg',
                          description: cardData[index]['description'] ??
                              'No Description',
                          logoPath: cardData[index]['logoPath'] ??
                              'assets/default.jpg',
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
