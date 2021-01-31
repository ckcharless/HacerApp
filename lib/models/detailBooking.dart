class Product{
  final int id, duration, totalPrice, teamA;
  final String bookCode, address, title, description, date, time, status, paymentStatus;

  Product({this.date, this.time, this.duration, this.totalPrice, this.teamA, this.status, this.id, this.bookCode, this.address, this.title, this.description, this.paymentStatus});
}

List<Product> products = [
  Product(
    id: 1,
    bookCode : 'ABCDEF',
    totalPrice: 1000,
    title: "Champion futsal",
    address: "Kebon Jeruk, Jakarta Barat",
    date : "12 January 2021",
    time : "18:00",
    duration: 2,
    teamA: 7,
    status: "On Going",
    description: "Join & Have Fun",
    paymentStatus: 'Paid'
  ),
  Product(
      id: 2,
      bookCode : 'GHIJKL',
      totalPrice: 2000,
      title: "Champion futsal",
      address: "Kebon Jeruk, Jakarta Barat",
      date : "12 January 2021",
      time : "18:00",
      duration: 4,
      teamA: 10,
      status: "Done",
      description: "Sparing 5 vs 5, Please bring 10 people",
      paymentStatus: 'Paid'
  ),
];