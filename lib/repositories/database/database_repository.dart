import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:azapp/repositories/database/base_database_repository.dart';
import 'package:azapp/repositories/storage/storage_repository.dart';

import '../../models/models/user_model.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return _firebaseFirestore
        .collection('users')
        .doc('NDgd7ODdpD7YSRwviObP')
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadURL(imageName);

    return _firebaseFirestore
        .collection('users')
        .doc('NDgd7ODdpD7YSRwviObP')
        .update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl])
    });
  }
}
