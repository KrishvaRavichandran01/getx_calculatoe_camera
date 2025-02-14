

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:image_picker/image_picker.dart';
import 'package:test_process/camera_controller.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImagePickerController controller = Get.put(ImagePickerController());
    button(){
      return Get.bottomSheet(backgroundColor:Color(0XFFFFFFEEE),Container(margin:EdgeInsets.only(left: 20,top: 20),height: 200,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("Upload via",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
        ListTile(onTap: (){controller.pickImage(ImageSource.camera);},leading:Image.network(height: 25,'https://t4.ftcdn.net/jpg/01/07/57/91/360_F_107579101_QVlTG43Fwg9Q6ggwF436MPIBTVpaKKtb.jpg'),title: Text("Camera",style: TextStyle(fontWeight: FontWeight.w500),),)
        ,Divider()
        , ListTile(onTap:()=> controller.pickImage(ImageSource.gallery),leading: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(height: 25,"https://img.favpng.com/15/7/23/computer-icons-download-user-interface-png-favpng-UgJFdMY0hUh7d2SSVc91E4DdW.jpg"),),title: Text('  Gallery',style: TextStyle(fontWeight: FontWeight.w500),),)],),),shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))) );
    }
    return Scaffold(body: SafeArea(child: Column(
      children: [
        Expanded(flex:1,child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: Image.network(
                'https://zenprospect-production.s3.amazonaws.com/uploads/pictures/647f0890310c360001544e6a/picture',
              ),
            ),
            title: Text(
              'RadicalStart',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),),
        Expanded(flex:7,child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25))),child: Column(children: [
                  Container(margin: EdgeInsets.only(top: 30),
                    child: Text(
                      'Upload Picture',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Stack( alignment: Alignment.center,
                      children: [
                        Container(  child: Center(
                            child: Obx((){return
                              controller.selectedImage.value != null?
                              Image.file(controller.selectedImage.value!,height: double.infinity,width: double.infinity,fit:BoxFit.fill,):
                              FloatingActionButton(backgroundColor: Color(0xFF651FFF),
                                child: Icon(CupertinoIcons.add,size: 50,color: Colors.white,),shape: CircleBorder(),onPressed: (){button();},);}))


                          ,
                          decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(30)),
                            color: Color(0xFFEEEEEE), ),height: MediaQuery.of(context).size.height*0.4,  ),



                      ],
                    ),
                  ),

                  Obx(() {return Visibility(
                    visible: controller.selectedImage.value != null,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [FloatingActionButton(backgroundColor: Color(0xFF651FFF),child: Iconify(Ph.note_pencil_duotone,color: Colors.white,size: 30,),onPressed: (){button();},shape: CircleBorder(),),SizedBox(width: 50,),FloatingActionButton(backgroundColor: Color(0xFF651FFF),child: Iconify(Teenyicons.tick_solid,color: Colors.white,size: 30,),onPressed: (){},shape: CircleBorder(),)],),
                    ),

                  );})],),)
            ),



          ],

        ),)
      ],
    )),);}}
