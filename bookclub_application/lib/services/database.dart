import 'package:bookclub_application/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OurDatabase {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _fireStore.collection("users").doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();

    DocumentSnapshot _documentSnapshot =
        await _fireStore.collection('users').doc(uid).get();
    retVal.uid = uid;
    retVal.fullName = _documentSnapshot.get("fullName");
    retVal.email = _documentSnapshot.get("email");
    retVal.accountCreated = _documentSnapshot.get("accountCreated");
    return retVal;
  }
}
