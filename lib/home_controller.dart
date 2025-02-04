import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs; // Tracks the selected tab

  void changePage(int index) {
    selectedIndex.value = index; // Updates the index
  }
}
 