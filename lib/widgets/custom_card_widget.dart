import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String logoPath;
  final String title;
  final String description;

  const CustomCardWidget({
    Key? key,
    required this.imagePath,
    required this.logoPath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      color: const Color.fromARGB(255, 64, 67, 69),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Logo, Title, and Heart Icon Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Store Logo (Rounded)
                    ClipOval(
                      child: Image.asset(
                        logoPath,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10), // Space between logo and title
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Title text color
                      ),
                    ),
                  ],
                ),
                // Heart Icon Button
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Color.fromARGB(255, 249, 246, 246),
                    size: 32,
                  ),
                  onPressed: () {
                    // Add functionality for liking the card
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Image in the Center
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),

            // Description
            Row(
              children: [
                Expanded(
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Description text color
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2, // Prevents overflow
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
