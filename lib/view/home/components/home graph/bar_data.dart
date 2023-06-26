
class BarData {
  final int cars;
  final int drivers;
  final int users;
  final int bookings;
  BarData({
    required this.cars,
    required this.drivers,
    required this.users,
    required this.bookings,
  });

  List<IndividialBar> barData = [];

  // initialize bar data
  void initializeBarData() {
    barData = [
      // cars
      IndividialBar(x: 0, y: cars),
      // Drivers
      IndividialBar(x: 1, y: drivers),
      // users
      IndividialBar(x: 2, y: users),
      // Bookings
      IndividialBar(x: 3, y: bookings),
    ];
  }
}
class IndividialBar {
  final int x; // postition on x axis
  final int y; // value on y axis

  IndividialBar({
    required this.x,
    required this.y,
  });
}
