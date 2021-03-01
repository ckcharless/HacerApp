class NotifUser{
  final int id, price;
  final String alamat, date, bookingcode, time, status;

  NotifUser({this.id, this.price, this.alamat,this.date, this.bookingcode, this.time, this.status});
}

List<NotifUser> NotifUsers = [
  NotifUser(
    id: 1,
    price: 120000,
    status: "SUCESS BOOKING !!",
    alamat: "Champion Futsal,Kebun Jeruk no 20,Jakarta Barat",
    date: "13 FEB 2021 | 12:00-14:00",
    bookingcode: "BOOKING CODE: 56843547",
    time: "10/2/2021 (13.45)"
  ),
  NotifUser(
    id: 2,
    price: 150000,
    status: "SPARING CONFIRMED !!",
    alamat: "ABM Futsal, Jalan Panjang no 50, Jakarta Barat",
    date: "9 FEB 2021 | 12:00-15:00",
    bookingcode: "BOOKING CODE: 56478412",
    time: "8/2/2021 (09:13)"
  ),
  NotifUser(
    id: 3,
    price: 180000,
    status: "SUCCESS BOOKING !!",
    alamat: "Champion Futsal,Kebun Jeruk no 20,Jakarta Barat",
    date: "3 FEB 2021 | 16:00-18:00",
    bookingcode: "BOOKING CODE: 67876854",
    time: "1/2/2021 (18:13)"
  ),
  

];