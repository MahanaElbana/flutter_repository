class Product {
  final String id;
  final String name;

  Product({required this.id, required this.name});

  Product copyWith(
    String? id,
    String? name,
  ) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}

void main() {
  Product product = Product(id: '1', name: 'dssd');
  Product product2  = product.copyWith("3", null);
  print(product2.name);
}
