import 'package:get/get.dart';
import 'package:nutri_edge/models/objectives.dart';

class NewDietController extends GetxController {
  final selectedObjective = Objectives.cutting.obs;
  final selectedIntolerances = <String>[].obs;
  final alergies = <String>[].obs;

  static NewDietController get to => Get.find();
}
