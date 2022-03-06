class Product{
  String title;
  double price;
  String description;
  String imageUrl;
   bool isLiked;


  Product(this.title,this.price,this.description,this.imageUrl,this.isLiked);




  @override
  String toString() {
    return 'Product{title: $title, price: $price, description: $description, imageUrl: $imageUrl}';
  }
}