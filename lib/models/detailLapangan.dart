class Product{
  final int id, price;
  final String title, description, image, openTime, closeTime, facility;

  Product({this.id, this.price, this.title,this. description, this.image, this.closeTime, this.facility, this.openTime});
}

List<Product> products = [
  Product(
    id: 1,
    price: 1000,
    title: "CHAMPION FUTSAL",
    image: "assets/images/lapangan1.jpg",
    description: "Murah banget pokoknya",
    openTime: '08:00',
    closeTime: '21:00',
    facility: 'WC, Mushola, Minimarket, Free Parkir'
  ),
  Product(
    id: 2,
    price: 4000,
    title: "Champion futsal 2",
    image: "assets/images/lapangan2.jpg",
    description: "Agak mahal",
      openTime: '08:00',
      closeTime: '21:00',
      facility: 'WC, Mushola, Minimarket, Free Parkir'
  ),
  Product(
    id: 3,
    price: 5000,
    title: "Champion futsal 3",
    image: "assets/images/lapangan3.jpg",
    description: "Mahal cok",
      openTime: '08:00',
      closeTime: '21:00',
      facility: 'WC, Mushola, Minimarket, Free Parkir'
  ),
  Product(
    id: 4,
    price: 8000,
    title: "Champion futsal 4",
    image: "assets/images/lapangan4.jpg",
    description: "Mahal banget sumpah",
      openTime: '08:00',
      closeTime: '21:00',
      facility: 'WC, Mushola, Minimarket, Free Parkir'
  ),
];