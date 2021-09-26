import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:world_of_paladins/api/api_paladins_hirez.dart';
import 'package:world_of_paladins/models/champion_model.dart';
import 'package:world_of_paladins/services/global.dart';
import 'package:world_of_paladins/services/utils.dart';

class ChampionController extends GetxController {
  late Champion champion = Champion();
  final gb = Get.find<Global>();
  final utils = Get.find<Utils>();
  final api = ApiPaladinsHirez();
  var index = 0.obs;
  List<Ability1> habilidades = [];
  int champId = 0;
  List talentos = [];
  List cartas = [];
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
      champId = champion.id!;
      getCardsChampion();
    }
    super.onInit();
  }

  Future<void> getCardsChampion() async {
    var response = await api.getCardChampion(champId: champId, sessionId: gb.sessionId.value);
    if (response != null) {
      for (var item in response) {
        if (item['championTalent_URL'] != null)
          talentos.add(item);
        else
          cartas.add(item);
      }
    }
    update();
  }
}
