import 'dart:io';
import '../database/database_repository.dart';
import 'base_storage_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(XFile image) async {
    await storage
        .ref('user_1/${image.name}')
        .putFile(
          File(image.path),
        )
        .then(
          (p0) => DatabaseRepository().updateUserPictures(image.name),
        )
        .catchError((e) => {});
  }

  @override
  Future<String> getDownloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('user_1/$imageName').getDownloadURL();
    return downloadURL;
  }
}
