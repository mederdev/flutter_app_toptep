import 'package:firebase_auth/firebase_auth.dart';

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e); // TODO: show dialog with error
  }
}
