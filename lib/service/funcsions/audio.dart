import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mylibrary/screens/pages/add.dart';

String downloadUrl = "";
int fileSize = 0;
Future<void> selectAndUploadAudioFile() async {
//==================================== Select Audio File ====================================
  File? selectedFile;
  
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(type: FileType.audio, allowMultiple: false);
  if (result != null) {
    selectedFile = File(result.files.single.path!);
    fileSize = await selectedFile.length();
    print("Tanlangan audio path manzili: ${selectedFile.path}");

//==================================== Upload Audio File ====================================
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageReference = storage.ref().child(
            "Audio Part/${nameController.text}.mp3",
          );
      if (true) {
        downloadUrl = await storageReference.getDownloadURL();
      }
      UploadTask uploadTask = storageReference.putFile(selectedFile);

      await uploadTask.whenComplete(() {
        print("Audio yuklandi");
      });
    } catch (e) {
      print("Xatolik mavjud: $e");
    }
  } else {
    print("Siz tanlagan fayl mavjud emas yoki buzilgan");
  }
}

Future<void> uploadDataFirestoreDatabase(Map<String, dynamic> data) async {
    try {
      CollectionReference reference =
          FirebaseFirestore.instance.collection("Audio");
      await reference.add(data);
      print("Data added successfully");
    } catch (e) {
      print("Error adding data: $e");
    }
  
}
