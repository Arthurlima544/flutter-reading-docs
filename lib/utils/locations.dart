class Locations {
  final String imagePath;
  final String name;
  final String country;

  Locations({
    required this.imagePath,
    required this.name,
    required this.country,
  });
}

final locations = [
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/great-bear-rainforest.jpg",
    name: "Great Bear Rainforest",
    country: "Canada",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/burgundy.jpg",
    name: "Burgundy",
    country: "France",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/bora-bora.jpg",
    name: "Bora Bora",
    country: "French Polynesia",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/asheville.jpg",
    name: "Asheville",
    country: "USA",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/antelope-canyon.jpg",
    name: "Antelope Canyon",
    country: "United States",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/angkor-wat.jpg",
    name: "Angkor Wat",
    country: "Cambodia",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/amazon-rainforest.jpg",
    name: "Amazon Rainforest",
    country: "Brazil",
  ),
  Locations(
    imagePath:
        "https://storage.googleapis.com/tripedia-images/destinations/amalfi-coast.jpg",
    name: "Amalfi Coast",
    country: "Italy",
  ),
];
