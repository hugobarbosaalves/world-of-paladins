import 'package:get/get.dart';
import 'package:world_of_paladins/models/champion_model.dart';

class ChampionController extends GetxController {
  late Champion champion = Champion();
  var index = 0.obs;
  List<Ability1> habilidades = [];
  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      champion = Champion.fromJson(Get.arguments);
      habilidades.add(champion.ability_1!);
      habilidades.add(champion.ability_2!);
      habilidades.add(champion.ability_3!);
      habilidades.add(champion.ability_4!);
      habilidades.add(champion.ability_5!);
    }
    super.onInit();
  }
}
