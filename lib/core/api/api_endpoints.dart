class ApiEndPoints {
  /*----------------Authentication side---------------------------*/

  static String register = '/register';
  static String verifyOtp = '/verify';
  static String login = '/login';
  static String forgotpassword = '/accounts/password';
  static String fogotOtpverification = '/verifyOtp';

  /*----------------admin side---------------------------*/

  static String getcategory = '/admin/categories';
  static String carousal = '/admin/carousal';

  /*----------------Product side---------------------------*/

  static String getAllProducts = '/products';
  static String getsingleProducts = '/products/';
    static String catedoryProducts = '/products?category=';


  /*----------------Product Cart side---------------------------*/

  static String postProductToCart = '/cart';


    /*----------------Product Wishlist side---------------------------*/

  static String wishlist = '/wishlist';
  static String removewishlist='/wishlist/';



      /*----------------Product Addrerss side---------------------------*/

  static String address = '/profile/address';
  static String removeaddress='/profile/address/';

 
}
