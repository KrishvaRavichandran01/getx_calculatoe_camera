import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_process/camera_page.dart';
import 'package:test_process/home_controller.dart';
import 'package:test_process/home_page.dart';
import 'package:test_process/second_page.dart';



class MainScreen extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(() {
        // Display the selected page based on `selectedIndex`
        return IndexedStack(
          index: navController.selectedIndex.value,
          children: [
            HomePage(),
            Upload(),
            ProfilePage(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          onTap: (index) {
            navController.changePage(index); // Update the selected tab
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_work_outlined),
              label: 'Getx',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.photo),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
