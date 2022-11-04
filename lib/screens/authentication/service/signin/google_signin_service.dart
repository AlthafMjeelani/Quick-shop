import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInSErvice {
  /*------------------- SignIn  with Google ----------------------*/

  static Future<GoogleSignInAccount?> googleSignIn(
      GoogleSignIn googleSignIn) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      /*  call Signin Fuction   */
      final result = await googleSignIn.signIn();
      return result;
    }
    /*  Catch error   */

    catch (e) {
      log(e.toString());
      // DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
