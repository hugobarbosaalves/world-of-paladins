import 'package:get/get.dart';
import 'package:world_of_paladins/api/api_paladins_hirez.dart';

import 'package:world_of_paladins/services/global.dart';
import 'package:world_of_paladins/services/utils.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final gb = Get.find<Global>();
  final utils = Get.find<Utils>();
  final api = ApiPaladinsHirez();
  List campeoes = [];
  List campeoesExibicao = [];

  RxBool btnSupSelecionado = false.obs;
  RxBool btntankSelecionado = false.obs;
  RxBool btnFlankSelecionado = false.obs;
  RxBool btnDmgSelecionado = false.obs;
  RxBool btnAll = true.obs;

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    incialLoad();
    super.onInit();
  }

  Future<void> incialLoad() async {
    if (gb.sessionId.value == "") await gb.createSession();
    await getChampions();
  }

  Future<void> getChampions() async {
    var response = await api.getChampions(sessionId: gb.sessionId.value);
    if (response != null) {
      for (var item in response) {
        campeoes.add(item);
        campeoesExibicao.add(item);
      }
    }
    update();
  }

  void selecionafiltroClass(int tipo) {
    //0 all
    //1 sup
    //2 tank
    //3 flanco
    //4 damage

    if (tipo == 0) {
      campeoesExibicao.clear();
      for (var item in campeoes) {
        campeoesExibicao.add(item);
      }
      btnSupSelecionado.value = false;
      btntankSelecionado.value = false;
      btnFlankSelecionado.value = false;
      btnDmgSelecionado.value = false;
      btnAll.value = true;
    }
    if (tipo == 1) {
      campeoesExibicao.clear();
      for (var item in campeoes) {
        if (item["Roles"].contains("Suporte")) {
          campeoesExibicao.add(item);
        }
      }

      btnSupSelecionado.value = true;
      btntankSelecionado.value = false;
      btnFlankSelecionado.value = false;
      btnDmgSelecionado.value = false;
      btnAll.value = false;
    }
    if (tipo == 2) {
      campeoesExibicao.clear();
      for (var item in campeoes) {
        if (item["Roles"].contains("Tanque")) {
          campeoesExibicao.add(item);
        }
      }
      btntankSelecionado.value = true;
      btnSupSelecionado.value = false;
      btnFlankSelecionado.value = false;
      btnDmgSelecionado.value = false;
      btnAll.value = false;
    }
    if (tipo == 3) {
      campeoesExibicao.clear();
      for (var item in campeoes) {
        if (item["Roles"].contains("Flanco")) {
          campeoesExibicao.add(item);
        }
      }
      btnFlankSelecionado.value = true;
      btnSupSelecionado.value = false;
      btntankSelecionado.value = false;
      btnDmgSelecionado.value = false;
      btnAll.value = false;
    }
    if (tipo == 4) {
      campeoesExibicao.clear();
      for (var item in campeoes) {
        if (item["Roles"].contains("Dano")) {
          campeoesExibicao.add(item);
        }
      }
      btnDmgSelecionado.value = true;
      btnSupSelecionado.value = false;
      btntankSelecionado.value = false;
      btnFlankSelecionado.value = false;
      btnAll.value = false;
    }
    update();
  }
}
