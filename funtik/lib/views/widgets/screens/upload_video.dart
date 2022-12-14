

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:video_compress/video_compress.dart';

import '../../../constants.dart';
import '../../../controllers/video.dart';

class UploadVideoController extends GetxController {
  
  // _compressVideo(String videoPath) async {
  //   final compressedVideo = await VideoCompress.compressVideo(
  //     videoPath,
  //     quality: VideoQuality.DefaultQuality,
  //     // deleteOrigin: false,
  //   );
  //   if(compressedVideo==null){
  //     print("ADRSH");
  //   }
  //   return  compressedVideo!.file;
  // }
//   MediaInfo? _compressVideo = await VideoCompress.compressVideo(
//  videoPath,
//   quality: VideoQuality.DefaultQuality, 
//   deleteOrigin: false, // It's false by default
// );

  Future<String> _uploadVideoToStorage(String id, String VideoPath) async {
    Reference ref = FirebaseStorage.instance.ref().child('videos').child(id);

    // ignore: await_only_futures
  
    File  videoPath = File(VideoPath);
    UploadTask uploadTask = ref.putFile( videoPath);//await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // upload video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      // get id
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
       String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
      //  profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
        thumbnail: thumbnail,
      );

      await firestore.collection('videos').doc('Video $len').set(
            video.toJson(),
          );
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }
}