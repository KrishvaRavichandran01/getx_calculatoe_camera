import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_process/calculator_controller.dart';



class HomePage extends StatelessWidget {

  Color black(){
    return Colors.black;
  }
  Color colorbutton(){
    return Color(0xFFEDE7F6);
  }


  final CalculatorController controller =Get.put(CalculatorController());

  // This widget is the root of your application.
  SizedBox Sizedbox_for_between_container(){
    return SizedBox(
      width: 25,
    );
  }

  Widget calculate(){
    return Container(
      constraints: BoxConstraints(
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),color: Colors.white
      ),
    );
  }
  Widget button(var text,Color,Colorlast){
    return GestureDetector(onTap: (){
      controller.addInput(text);
    },child: Container(alignment: Alignment.center,child: Text(text,style: TextStyle(fontSize: 35,color: Colorlast,fontWeight: FontWeight.w500),),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: Color),height: 75,width: 75,
      margin: EdgeInsetsDirectional.all(9),));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
          children: [
            Container(
              height:80,width: 400,color:colorbutton()
              ,child: Column(
              children: [SizedBox(height: 10,),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Image.network(
                      'https://zenprospect-production.s3.amazonaws.com/uploads/pictures/647f0890310c360001544e6a/picture',
                    ),
                  ),
                  title: Text(
                    'RadicalStart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ),
            Expanded(child: Container(decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(45),topRight:Radius.circular(45) ),color: Colors.white,

            ),child: Column(
              children: [
                Row(children: [  button('C',Color(0xFFEEEEEE),Colors.black,),button('%',Color(0xFFEEEEEE),Colors.black),button('⌫',Color(0xFFEEEEEE),Colors.black),button('÷',Color(0xFFFF9100),Colors.white),],),
                Row(children: [  button('7',colorbutton(),Colors.black),button('8',colorbutton(),Colors.black),button('9',colorbutton(),Colors.black),button('×',Color(0xFFFF9100),Colors.white),],),
                Row(children: [  button('4',colorbutton(),Colors.black),button('5',colorbutton(),Colors.black),button('6',colorbutton(),Colors.black),button('-',Color(0xFFFF9100),Colors.white),],),
                Row(children: [  button('3',colorbutton(),Colors.black),button('2',colorbutton(),Colors.black),button('1',colorbutton(),Colors.black ),button('+',Color(0xFFFF9100),Colors.white),],),

                Row(children: [  button( '.',colorbutton(),Colors.black),button('0',colorbutton(),Colors.black),button('00',colorbutton(),Colors.black),button('=',Color(0xFF651FFF),Colors.white),],),
                Container(
                    height: 130,width: 380,
                    decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(30)),
                    child: Obx((){return Column(
                      children: [SizedBox(height: 10,), Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 70,child: Text(controller.result.value,style: TextStyle(fontSize: 39,fontWeight: FontWeight.w500,),),
                              decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ],
                      ),Row(mainAxisAlignment: MainAxisAlignment.end,verticalDirection: VerticalDirection.up,
                        children: [
                          Container(
                            height: 50,child: Text(controller.expression.value,style: TextStyle(fontSize: 29,fontWeight: FontWeight.w500,),),

                          ),
                        ], ),
                      ],);})
                ),



              ],
            ),

            ))          ],

        ));

     }}