class EndPoint {
  static const String baseUrl = 'https://fakestoreapi.com';

  // Auth
  static const String login = '/auth/login';

  // Users
  static const String users = '/users';
  static String userById(int id) => '/users/$id';
  static const String getAllUsers = '/users';
  static const String getUserById = '/users'; 
  static const String signUp = '/users';    

  // Products
  static const String products = '/products';
  static String productById(int id) => '/products/$id';
  static const String categories = '/products/categories';
  static String productsByCategory(String category) => '/products/category/$category';

  // Carts
  static const String carts = '/carts';
  static String cartById(int id) => '/carts/$id';
  static String cartsByUser(int userId) => '/carts/user/$userId';
  static String cartsByDateRange(String startDate, String endDate) =>
      '/carts?startdate=$startDate&enddate=$endDate';
}
class ApiKeys {
  static const String message = 'message';
  static const String statusCode = 'statusCode';

  static const String id = 'id';
  static const String email = 'email';
  static const String username = 'username';
  static const String password = 'password';
  static const String name = 'name';
  static const String address = 'address';
  static const String phone = 'phone';

  static const String title = 'title';
  static const String price = 'price';
  static const String description = 'description';
  static const String category = 'category';
  static const String image = 'image';

  static const String date = 'date';
  static const String products = 'products';
  static const String productId = 'productId';
  static const String quantity = 'quantity';

  static const String token = 'token';


}
