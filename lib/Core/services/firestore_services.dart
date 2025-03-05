import 'dart:developer';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitsapp/Core/errors/Customexception.dart';
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
  
  @override
  Future<void> sendVerificationCode(String email) async {
  // إنشاء كود عشوائي مكون من 6 أرقام
  String code = (100000 + math.Random().nextInt(900000)).toString();

  // التحقق مما إذا كان البريد الإلكتروني مسجلاً
  var user = await _firestore.collection('users').where('email', isEqualTo: email).get();
  if (user.size == 0) {
    throw Customexception(message:"البريد الإلكتروني غير مسجل");
  }
  
  // حفظ الكود في Firestore مع وقت انتهاء الصلاحية
  await FirebaseFirestore.instance.collection('password_resets').doc(email).set({
    'code': code,
    'createdAt': FieldValue.serverTimestamp(),
  });

  // إرسال الكود عبر البريد الإلكتروني (يمكن استخدام خدمة مثل SendGrid)
  log("تم إرسال الكود: $code"); // استخدم خدمة فعلية بدلاً من الطباعة
}
  
  @override
 Future<bool> verifyCode(String email, String enteredCode) async {
  var doc = await FirebaseFirestore.instance.collection('password_resets').doc(email).get();

  if (!doc.exists) return false;

  String storedCode = doc['code'];
  return storedCode == enteredCode;
}


}