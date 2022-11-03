import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInSErvice {
  /*------------------- Sign In  with Google ----------------------*/

  static Future<GoogleSignInAccount?> googleSignIn(
      GoogleSignIn googleSignIn) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      /*  call Signin Fuction   */
      final result = await googleSignIn.signIn();
      log('called');
      return result;
    }on PlatformException catch(e){
      log(e.toString());
    }

    /*  Catch error   */

    catch (e) {
      log(e.toString());
     // DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
