abstract class Services{
 Future<void> adduserData({required String collectionname, required Map<String, dynamic> data , required String uid});
 Future< Map<String, dynamic>> getUserData({required String collectionname,required String uid});
  
}