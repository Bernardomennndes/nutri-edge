import 'package:get/get.dart';
import 'package:nutri_edge/models/diet.dart';

class DietsController extends GetxController {
  var diets = <Diet>[].obs;
  static DietsController get to => Get.find();

  addDiet(Diet diet) {
    diets.add(diet);
  }

  deleteDiet(Diet diet) {
    diets.remove(diet);
  }
}
