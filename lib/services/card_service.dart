class CardService {
  List<Map<String, String>> getCards() {
    return [
      {
        'logoPath': 'assets/logo.png',
        'title': 'Latest Gadgets',
        'imagePath': 'assets/card4.jpg',
        'description': 'Exciting offers on latest gadgets!',
      },
      {
        'logoPath': 'assets/logo.png',
        'title': 'Fashion Trends',
        'imagePath': 'assets/card2.jpg',
        'description': 'Exclusive discounts on fashion trends!',
      },
      {
        'logoPath': 'assets/logo.png',
        'title': 'New Furniture',
        'imagePath': 'assets/card3.jpg',
        'description': 'Explore our new collection of furniture!',
      },
      {
        'logoPath': 'assets/logo.png',
        'title': 'Electronics Sale',
        'imagePath': 'assets/card1.jpg',
        'description': 'Special weekend sale on electronics!',
      },
    ];
  }
}
