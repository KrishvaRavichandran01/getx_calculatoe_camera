import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class Imagecontroller extends GetxController{
  RxString imagePath =''.obs;
  Future getImage(ImageSource)async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource);
    if(image != null){
      imagePath.value =image.path.toString();
    }
  }
}