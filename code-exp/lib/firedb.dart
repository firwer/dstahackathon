// Static class contains all methods for CRUD for Firebase DB
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_exp/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firedb {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static void createUser(
      String name, String gender, int height, double weight) async {
    print(FirebaseAuth.instance.currentUser!.uid);
    await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': name,
      'height': height,
      'weight': weight,
      'gender': gender
    });
  }

  static void getUserInfo() async {
    await db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((response) {
      myUser.name = response['name'];
      myUser.height = response['height'];
      myUser.weight = response['weight'];
      myUser.gender = response['gender'];
    });
  }
}
