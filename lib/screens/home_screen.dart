import 'package:flutter/material.dart';

import '../services/card_service.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/categories_bar.dart';
import '../widgets/custom_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
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
      backgroundColor: const Color.fromARGB(255, 40, 39, 39),
      body: Column(
        children: [
          // Fixed Top Section
          Container(
            color: const Color.fromARGB(255, 64, 67, 69),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
            child: Column(
              children: [
                // Logo & Store Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset('assets/logo.jpg',
                              height: 45, width: 45, fit: BoxFit.cover),
                        ), // Store Logo
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Online Store',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'M1X 1M2',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 43, 157, 250),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Settings Icon
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Search Bar
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 105, 102, 102),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const TextField(
                    style: TextStyle(
                        color: Color.fromARGB(255, 235, 234, 234),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: 'Search deals and stores ',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 228, 226, 226),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 198, 198, 198),
                        size: 32,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Horizontal Scrollable Categories Bar
                CategoriesBar(
                  categories: categories,
                  onCategorySelected: _onCategorySelected,
                ),
              ],
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
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
                            'assets/poster20.avif',
                            width: 385,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // const SizedBox(height: 14),
                        // const Text(
                        //   "Big Sale On Now...!",
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // const SizedBox(height: 8),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Section Title with "See All"
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left-side text
                        const Text(
                          "Great Canadian Savings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Right-side "See All" text
                        GestureDetector(
                          onTap: () {
                            // Add navigation or function for "See All" here
                          },
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 43, 157, 250), // Blue color
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // White Separator Line
                  Container(
                    height: 2,
                    width: 380,
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
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0), // Adjust padding
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.6, // 90% of screen width
                                child: CustomCardWidget(
                                  title: cardData[index]['title'] ?? 'No Title',
                                  imagePath: cardData[index]['imagePath'] ??
                                      'assets/default.jpg',
                                  description: cardData[index]['description'] ??
                                      'No Description',
                                  logoPath: cardData[index]['logoPath'] ??
                                      'assets/default.jpg',
                                ),
                              ),
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
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
