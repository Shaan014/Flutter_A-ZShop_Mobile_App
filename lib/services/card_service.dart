class CardService {
  List<Map<String, String>> getCards() {
    return [
      {
        'logoPath': 'assets/walmartlogo.jpg',
        'title': 'Walmart',
        'imagePath': 'assets/card1.jpg',
        'description': 'New',
      },
      {
        'logoPath': 'assets/spar.png',
        'title': 'SPAR',
        'imagePath': 'assets/card2.jpg',
        'description': 'Great Savings!',
      },
      {
        'logoPath': 'assets/cargills.png',
        'title': 'Cargills Food',
        'imagePath': 'assets/card4.jpg',
        'description': '10% Discount',
      },
      {
        'logoPath': 'assets/eleven.png',
        'title': '7-Eleven',
        'imagePath': 'assets/card3.jpg',
        'description': 'On Sale',
      },
    ];
  }
}
