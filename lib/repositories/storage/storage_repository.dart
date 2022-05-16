import 'dart:io';
import '../../models/models/user_model.dart';
import '../database/database_repository.dart';
import 'base_storage_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(User user, XFile image) async {
    await storage
        .ref('${user.id}/${image.name}')
        .putFile(
          File(image.path),
        )
        .then(
          (p0) => DatabaseRepository().updateUserPictures(user, image.name),
        )
        .catchError((e) => {});
  }

  @override
  Future<String> getDownloadURL(User user, String imageName) async {
    String downloadURL =
        await storage.ref('${user.id}/$imageName').getDownloadURL();
    return downloadURL;
  }
}
