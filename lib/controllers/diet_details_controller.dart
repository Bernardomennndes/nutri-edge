import 'package:get/get.dart';
import 'package:nutri_edge/models/diet.dart';

class DietDetailsController extends GetxController {
  final diet = Diet().obs;
  static DietDetailsController get to => Get.find();
}
