import 'package:get/get.dart';
import 'package:nutri_edge/models/profile.dart';

class ProfileController extends GetxController {
  var profile = Profile().obs;
  static ProfileController get to => Get.find();

  void updateFields({
    String? name,
    int? age,
    double? weight,
    int? height,
    String? sex,
    String? avatarSrc,
  }) {
    profile.update((val) {
      if (name != null) {
        val!.name = name;
      }
      if (age != null) {
        val!.age = age;
      }
      if (weight != null) {
        val!.weight = weight;
      }
      if (height != null) {
        val!.height = height;
      }
      if (sex != null) {
        val!.gender = sex;
      }
      if (avatarSrc != null) {
        val!.avatarSrc = avatarSrc;
      }
    });
  }
}
