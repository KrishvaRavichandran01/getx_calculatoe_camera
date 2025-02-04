import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:image_picker/image_picker.dart';
import 'package:test_process/camera_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Imagecontroller controller = Get.put(Imagecontroller());
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
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
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          height: 800,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Text(
                    'Upload Picture',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFEEEE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                    child: Column(
                      children: [
                        Obx(() {
                          // Display selected image or a placeholder
                          return controller.imagePath.value == ''
                              ? Text("No image selected", style: TextStyle(fontSize: 16))
                              : Image.file(
                            File(controller.imagePath.toString()),
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          );
                        }),
                        SizedBox(height: 100,),
                        FloatingActionButton( child:Icon(Icons.add,size: 50,color: Colors.white,),backgroundColor: Color(0xFF651FFF),
                            shape: CircleBorder(),onPressed: (){
                              showModalBottomSheet(context: context, builder:(BuildContext context){
                                return Column( mainAxisAlignment:MainAxisAlignment.start,
                                  children: [ SizedBox(height: 100,),


                                    ElevatedButton(onPressed:()=>controller.getImage(ImageSource.camera),
                                        child:ListTile(leading: Icon(Icons.camera_alt_outlined,size: 30,),title: Text("Camera"),)),
                                    Divider(height: 40,),
                                    ElevatedButton(onPressed:()=>controller.getImage(ImageSource.gallery),
                                        child:ListTile(leading: Icon(Icons.photo_size_select_actual_outlined,size:30),title: Text("Gallery"),)),

                                  ],);
                              } );
                            })],)

                ),

              ],
            ),
          ),
        ),
      ],
    );}}
