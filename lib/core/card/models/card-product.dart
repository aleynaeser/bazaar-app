final class CardProduct {
  final int cardId;
  final String name;
  final String image;
  final String category;
  final int price;
  final String brand;
  final int quantity;
  final String username;

  const CardProduct({
    required this.cardId,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    required this.brand,
    required this.quantity,
    required this.username,
  });

  List<Object?> get props => [
    cardId,
    name,
    image,
    category,
    price,
    brand,
    quantity,
    username,
  ];

  factory CardProduct.fromJson(Map<String, dynamic> json) => CardProduct(
    cardId: json['sepetId'] as int,
    name: json['ad'] as String,
    image: json['resim'] as String,
    category: json['kategori'] as String,
    price: json['fiyat'] as int,
    brand: json['marka'] as String,
    quantity: json['siparisAdeti'] as int,
    username: json['kullaniciAdi'] as String,
  );
}
