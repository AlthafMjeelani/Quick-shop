class ApiEndPoints {
  /*----------------Authentication side---------------------------*/

  static String register = '/register';
  static String verifyOtp = '/verify';
  static String login = '/login';
  static String forgotpassword = '/accounts/password';
  static String fogotOtpverification = '/verifyOtp';

  /*----------------admin side---------------------------*/

  static String getcategory = '/admin/categories';

  /*----------------Product side---------------------------*/

  static String getAllProducts = '/products';
  static String getsingleProducts = '/products/';

  /*----------------Product Cart side---------------------------*/

  static String postProductToCart = '/cart';


    /*----------------Product Wishlist side---------------------------*/

  static String wishlist = '/wishlist';
  static String removewishlist='/wishlist/';
}
