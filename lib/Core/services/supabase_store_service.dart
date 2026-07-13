import 'package:fruitsapp/Core/services/services.dart';
import 'package:fruitsapp/Core/mock/mock_data.dart';
import 'package:fruitsapp/backend_keys.dart';

class SupabaseStoreService implements Services {
  @override
  Future<void> adduserData({required String collectionname, required Map<String, dynamic> data}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (collectionname == BackendKeys.userCollectionKey) {
      final db = MockDatabase.instance;
      final index = db.users.indexWhere((u) => u['id'] == data['id']);
      if (index != -1) {
        db.users[index] = data;
      } else {
        db.users.add(data);
      }
    }
  }

  @override
  Future<Map<String, dynamic>> getUserData({required String collectionname, required String uid}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (collectionname == BackendKeys.userCollectionKey) {
      final db = MockDatabase.instance;
      final matched = db.users.firstWhere(
        (u) => u['id'] == uid,
        orElse: () => {
          'id': uid,
          'name': 'عميل تجريبي',
          'email': 'customer@demo.com',
          'favourite': <int>[],
        },
      );
      return matched;
    }
    return {};
  }
  
  @override
  Future<void> updateUserData({required String collectionname, required String uid, required Map<String, dynamic> data}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (collectionname == BackendKeys.userCollectionKey) {
      final db = MockDatabase.instance;
      final index = db.users.indexWhere((u) => u['id'] == uid);
      if (index != -1) {
        db.users[index] = {
          ...db.users[index],
          ...data,
        };
        if (db.currentUser != null && db.currentUser!['id'] == uid) {
          db.currentUser = db.users[index];
        }
      }
    }
  }
}

