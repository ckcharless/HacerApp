class Product{
  final int id, price;
  final String title, description, image;

  Product({this.id, this.price, this.title,this. description, this.image});
}

List<Product> products = [
  Product(
    id: 1,
    price: 1000,
    title: "Champion futsal",
    image: "assets/images/lapangan1.jpg",
    description: "Murah banget pokoknya",
  ),
  Product(
    id: 2,
    price: 3000,
    title: "Champion futsal 2",
    image: "assets/images/lapangan1.jpg",
    description: "Agak mahal",
  ),
  Product(
    id: 3,
    price: 5000,
    title: "Champion futsal 3",
    image: "assets/images/lapangan1.jpg",
    description: "Mahal cok",
  ),
  Product(
    id: 4,
    price: 8000,
    title: "Champion futsal 5",
    image: "assets/images/lapangan1.jpg",
    description: "Mahal banget sumpah",
  ),
];