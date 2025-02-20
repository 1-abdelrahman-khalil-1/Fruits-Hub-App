import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitsapp/Core/services/services.dart';


class FirestoreService implements Services {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  @override
 Future<void> adduserData({required String collectionname, required Map<String, dynamic> data , required String uid}) async {
   await _firestore.collection(collectionname).doc(uid).set(data);
  }
  
@override
  Future< Map<String, dynamic>> getUserData({required String collectionname,required String uid}) async {
    final user = await _firestore.collection(collectionname).doc(uid).get();
    return user.data()!;
  }

}