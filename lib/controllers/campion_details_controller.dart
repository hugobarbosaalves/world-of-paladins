import 'package:get/get.dart';
import 'package:world_of_paladins/models/champion_model.dart';

class ChampionController extends GetxController {
  late Champion champion = Champion();
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
      //habilidades = Ability1.fromJson(Get.arguments["ability_1"]);

      // for (var i = 0; i < Get.arguments.length; i++) {
      //   if(Get.arguments[i].contains())
      // }
      // for(var item in ) {

      // }
      // for (var item in Get.arguments) {
      //   if (item.container("ability_1")) {
      //     habilidades.add(item);
      //   }
      //   if (item.container("ability_2")) {
      //     habilidades.add(item);
      //   }
      //   if (item.container("ability_2")) {
      //     habilidades.add(item);
      //   }
      //   if (item.container("ability_3")) {
      //     habilidades.add(item);
      //   }
      //   if (item.container("ability_4")) {
      //     habilidades.add(item);
      //   }
      // }
    }
    super.onInit();
  }
}
