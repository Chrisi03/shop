class Product{
  String title;
  double price;
  String description;
  String imageUrl;


  Product(this.title,this.price,this.description,this.imageUrl);

  @override
  String toString() {
    return 'Product{title: $title, price: $price, description: $description, imageUrl: $imageUrl}';
  }
}