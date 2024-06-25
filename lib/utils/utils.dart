import 'package:nutri_edge/models/profile.dart';

class Utils {
  static int basalMetabolicRateCalc(Profile profile) {
    if (profile.gender == 'Masculino') {
      return (66 +
              (13.7 * profile.weight) +
              (5 * profile.height) -
              (6.8 * profile.age))
          .toInt();
    } else {
      return (655 +
              (9.6 * profile.weight) +
              (1.8 * profile.height) -
              (4.7 * profile.age))
          .toInt();
    }
  }
}
