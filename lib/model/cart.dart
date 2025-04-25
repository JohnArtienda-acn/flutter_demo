class Cart {
  final String title;
  final String description;
  final String imageSrc;
  final double price;
  int quantity;
  final bool isLiked;

  Cart({
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.price,
    required this.quantity,
    required this.isLiked,
  });

  void increaseQuantity() => quantity++;
}
