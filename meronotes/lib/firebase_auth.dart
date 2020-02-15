import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

 
  // Future <String> signUpWithEmail(String email,String password)async{
  //   FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //   return user.uid;
  // }
   Future<bool> signInWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (user != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error Logging Out");
    }
  }
    // Sign in with google
  // Future<bool> loginWithGoogle() async {
  //   try {
  //     GoogleSignIn googleSignIn = GoogleSignIn();
  //     GoogleSignInAccount account = await googleSignIn.signIn();
  //     if (account == null) return false;
  //     AuthResult res = await _auth.signInWithCredential(
  //         GoogleAuthProvider.getCredential(
  //             idToken: (await account.authentication).idToken,
  //             accessToken: (await account.authentication).accessToken));
  //     if (res.user == null) return false;
  //     return true;
  //   } catch (e) {
  //     print("Error Logging with Google");
  //     return false;
  //   }
  // }
}
