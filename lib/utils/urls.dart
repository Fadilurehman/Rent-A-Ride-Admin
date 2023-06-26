class Urls {
  //BASE URL
// static String baseUrl = "http://192.168.45.198:7000/api";
  static String baseUrl = "https://fastrack-backend.onrender.com/api";
// ROUTES
  static String admin = "/admin";

  ///Functions which perform for an admin
  static String adminLogin = "/adminLogin";
  // USERS
  static String showUsers = "/users";
  static String blockUnblockUSer = "/blockAndUnblockUser";
  // PLACES
  static String showPlaces = "/getPlaces";
  static String addPlace = "/addPlace";
  static String deletePlace = "/deletePlace";
  // BRANDS
  static String showBrands = "/getBrands";
  static String addBrand = "/addBrand";
  static String deleteBrand = "/deleteBrand";
  // CARS
  static String showCars = "/cars";
  static String addCar = "/addCars";
  static String deleteCar = "/deleteCar";
  static String editCar = "/editCar";
  static String blockUnblockCar = "/blockAndUnblockCar";
  // BOOKINGS
  static String showBookings = "/getBookings";
  static String changeBookingStatus = "/changeStatus";
// DRIVERS
  static String showDrivers = "/drivers";
  static String approveDriver = "/approveDriver";
  static String declineDriver = "/declineDriver";
  static String blockUnblockDriver = "/blockAndUnblockDriver";
}
