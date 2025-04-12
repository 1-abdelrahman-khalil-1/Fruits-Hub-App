abstract class Services{
 Future<void> adduserData({required String collectionname, required Map<String, dynamic> data});
 Future< Map<String, dynamic>> getUserData({required String collectionname,required String uid});
  Future<void> updateUserData({required String collectionname, required String uid, required Map<String, dynamic> data});
 }