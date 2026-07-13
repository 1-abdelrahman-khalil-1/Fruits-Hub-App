import 'package:supabase_flutter/supabase_flutter.dart';

const Map<String, dynamic> aSSETS = {
  'productImages': [
    'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=400&q=80', // Apple
    'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&q=80', // Banana
    'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=400&q=80', // Strawberry
    'https://images.unsplash.com/photo-1547514701-42782101795e?w=400&q=80', // Orange
    'https://images.unsplash.com/photo-1553279768-865429fa0078?w=400&q=80', // Mango
    'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=400&q=80', // Watermelon
    'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=400&q=80', // Grapes
    'https://images.unsplash.com/photo-1595743825637-cdafc8ad4173?w=400&q=80', // Peach
    'https://images.unsplash.com/photo-1550258987-190a2d41a8ba?w=400&q=80', // Pineapple
    'https://images.unsplash.com/photo-1527661591475-527312dd65f5?w=400&q=80', // Cherry
  ],
};

class MockDatabase {
  static final MockDatabase instance = MockDatabase._();
  MockDatabase._() {
    _init();
  }

  late List<Map<String, dynamic>> users;
  late List<Map<String, dynamic>> products;
  Map<String, dynamic>? currentUser;

  T _get<T>(List<T> list, int index) => list[index % list.length];

  void _init() {
    // Demo credentials:
    //   Customer  → customer@demo.com / 12345678
    //   Admin     → admin@demo.com    / 12345678

    users = [
      {
        'id': 'customer-id-123',
        'name': 'عميل تجريبي',
        'email': 'customer@demo.com',
        'favourite': [1, 3],
      },
      {
        'id': 'admin-id-123',
        'name': 'مسؤول تجريبي',
        'email': 'admin@demo.com',
        'favourite': <int>[],
      }
    ];

    products = [
      {
        'id': 1,
        'name': 'تفاح أحمر طازج',
        'price': 50,
        'description':
            'تفاح أحمر طازج وغني بالفيتامينات، مستزرع عضويًا بنسبة 100% بدون أي مبيدات كيميائية. خيار مثالي لوجبة خفيفة وصحية.',
        'sellingCount': 120,
        'organic': true,
        'calories': 95,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 0),
        'category': 'فواكه'
      },
      {
        'id': 2,
        'name': 'موز بلدي حلو',
        'price': 30,
        'description':
            'موز بلدي طبيعي وحلو المذاق، مليء بالطاقة والبوتاسيوم. ممتاز للرياضيين والأطفال.',
        'sellingCount': 250,
        'organic': true,
        'calories': 105,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 1),
        'category': 'فواكه'
      },
      {
        'id': 3,
        'name': 'فراولة برية طازجة',
        'price': 60,
        'description':
            'حبات فراولة حمراء زاهية ومنتقاة بعناية. غنية بمضادات الأكسدة وفيتامين سي.',
        'sellingCount': 85,
        'organic': false,
        'calories': 32,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 2),
        'category': 'فواكه'
      },
      {
        'id': 4,
        'name': 'برتقال أبو سرة عصاري',
        'price': 25,
        'description':
            'برتقال أبو سرة ممتاز للعصير أو التناول المباشر، طعم متوازن وحموضة منعشة.',
        'sellingCount': 190,
        'organic': true,
        'calories': 62,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 3),
        'category': 'حمضيات'
      },
      {
        'id': 5,
        'name': 'مانجو عويس فاخرة',
        'price': 90,
        'description':
            'أجود أنواع المانجو المصرية، طعم سكري ورائحة نفاذة لا تقاوم. جودة تصديرية فاخرة.',
        'sellingCount': 300,
        'organic': true,
        'calories': 150,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 4),
        'category': 'فواكه استوائية'
      },
      {
        'id': 6,
        'name': 'بطيخ أحمر حلو',
        'price': 40,
        'description':
            'بطيخ طازج وحلو المذاق، مثالي للانتعاش في أيام الصيف الحارة ومصدر رائع للترطيب.',
        'sellingCount': 150,
        'organic': false,
        'calories': 80,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 5),
        'category': 'فواكه'
      },
      {
        'id': 7,
        'name': 'عنب أحمر بدون بذور',
        'price': 45,
        'description':
            'عنب أحمر مقرمش وحلو المذاق خالي تمامًا من البذور. مغسول وجاهز للتناول.',
        'sellingCount': 110,
        'organic': true,
        'calories': 69,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 6),
        'category': 'فواكه'
      },
      {
        'id': 8,
        'name': 'خوخ سكري طازج',
        'price': 55,
        'description':
            'خوخ طبيعي ناضج ذو ملمس ناعم ورائحة زكية. غني بالألياف والفيتامينات المفيدة للجسم.',
        'sellingCount': 95,
        'organic': true,
        'calories': 59,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 7),
        'category': 'فواكه'
      },
      {
        'id': 9,
        'name': 'أناناس استوائي ناضج',
        'price': 70,
        'description':
            'أناناس كامل وحلو النكهة، منتقى من أفضل المزارع الاستوائية لمذاق غني ومنعش.',
        'sellingCount': 60,
        'organic': false,
        'calories': 50,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 8),
        'category': 'فواكه استوائية'
      },
      {
        'id': 10,
        'name': 'كرز أحمر داكن',
        'price': 80,
        'description':
            'كرز طبيعي ذو لون داكن ونكهة غنية ولذيذة. يحتوي على كميات كبيرة من مضادات الأكسدة.',
        'sellingCount': 75,
        'organic': true,
        'calories': 50,
        'imageUrl': _get(aSSETS['productImages'] as List<String>, 9),
        'category': 'فواكه'
      }
    ];

    currentUser = null;
  }

  User? get supabaseCurrentUser {
    if (currentUser == null) return null;
    return User(
      id: currentUser!['id'],
      appMetadata: const {},
      userMetadata: {'full_name': currentUser!['name']},
      aud: 'authenticated',
      createdAt: DateTime.now().toIso8601String(),
      email: currentUser!['email'],
    );
  }

  Future<User> signIn(String email, String password) async {
    final matched = users.firstWhere(
      (u) => u['email'] == email,
      orElse: () => throw const AuthException(
          'البريد الإلكتروني أو كلمة المرور غير صحيحة.'),
    );
    currentUser = matched;
    return supabaseCurrentUser!;
  }

  Future<User> signUp(String name, String email, String password) async {
    final exists = users.any((u) => u['email'] == email);
    if (exists) {
      throw const AuthException('البريد الإلكتروني مسجل بالفعل.');
    }
    final newUser = {
      'id': 'user-id-${users.length + 1}',
      'name': name,
      'email': email,
      'favourite': <int>[],
    };
    users.add(newUser);
    currentUser = newUser;
    return supabaseCurrentUser!;
  }

  Future<User?> signInWithGoogle() async {
    currentUser = users.firstWhere((u) => u['email'] == 'customer@demo.com');
    return supabaseCurrentUser;
  }
}
