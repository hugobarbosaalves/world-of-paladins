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
    createSession();
    super.onInit();
  }

  Future<void> createSession() async {
    // Get Signature that is specific to "createsession"
    var signature =
        '${gb.devKey}createsession${gb.authKey}${DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc())}';
    signature = utils.getMD5(signature);

    var url =
        "${gb.urlPrefix}createsessionJson/${gb.devKey}/$signature/${DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc())}";

    var response = await api.createSession(url);

    if (response.statusCode == 200) {
      if (response.body["ret_msg"] == "Approved") {
        gb.sessionId.value = response.body["session_id"];
        getChampions();
      } else {
        //deu falha na criação da session_id
        print(response.body["ret_msg"]);
      }
      print("deu bom");
    } else {
      //deu falha na request
      print('Falha ao realizar a request CodStatus:${response.statusCode}');
      print('Falha ao realizar a request MSG:${response.body["ret_msg"]}');
    }
  }

  //return $list_champions;
  Future<void> getChampions() async {
    // Call the "getchampions" API method & wait for synchronous response
    var signature =
        '${gb.devKey}getchampions${gb.authKey}${DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc())}';
    signature = utils.getMD5(signature);

    var languageCode = '10';
    DateTime concat = DateTime.now().toUtc();
    var url =
        '${gb.urlPrefix}getchampionsjson/${gb.devKey}/$signature/${gb.sessionId.value}/${DateFormat('yyyyMMddHHmmss').format(concat)}/$languageCode';

    var response = await api.getChampions(url);
    if (response.statusCode == 200) {
      for (var item in response.body) {
        campeoes.add(item);
        campeoesExibicao.add(item);
      }
    } else {
      print('Falha ao realizar a request CodStatus:${response.statusCode}');
      print('Falha ao realizar a request MSG:${response.body["ret_msg"]}');
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
