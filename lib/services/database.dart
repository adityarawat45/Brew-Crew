import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter_application_3/models/brew.dart";
import "package:flutter_application_3/models/usermodel.dart";

class DataBaseService {
  final String uid;
  DataBaseService({required this.uid});
  CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("Brews");

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Brew> _brewListFromss(QuerySnapshot snapshot) {
    return snapshot.docs.map<Brew>((doc) {
      return Brew(
          
          name: doc.get("name") ?? "",
          sugars: doc.get("sugars") ?? "0",
          strength: doc.get("strength") ?? 0);
    }).toList();
  }

  //get brew stream
  Stream<List<Brew>?> get brews {
    return brewCollection.snapshots().map(_brewListFromss);
  }

  UserData _userDatafromSS(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      sugars: snapshot.get("sugars"),
      name: snapshot.get("name"),
      strength: snapshot.get("strength"),
    );
  }

  //get user data stream
  Stream<UserData> get userdata {
    return brewCollection.doc(uid).snapshots().map(_userDatafromSS);
  }
}
