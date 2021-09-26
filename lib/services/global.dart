import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:world_of_paladins/api/api_paladins_hirez.dart';
import 'package:world_of_paladins/services/utils.dart';
import 'package:world_of_paladins/widgets/load_padrao.dart';

class Global extends GetxService {
  String devKey = '3712'; // devKey goes here
  String authKey = 'A95E29F9212A4155988E6DB70036A290'; // authKey goes here
  //string urlPrefix = "http://api.smitegame.com/smiteapi.svc/";
  String urlPrefix = 'https://api.paladins.com/paladinsapi.svc/';
  var sessionId = ''.obs;
  final api = ApiPaladinsHirez();
  final utils = Utils();

  Future<Global> inicia() async {
    return this;
  }

  Future<void> createSession() async {
    // Get Signature that is specific to "createsession"
    var signature =
        '${devKey}createsession$authKey${DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc())}';
    signature = utils.getMD5(signature);

    var url =
        "${urlPrefix}createsessionJson/$devKey/$signature/${DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc())}";

    var response = await api.createSession(url);

    if (response.statusCode == 200) {
      if (response.body["ret_msg"] == "Approved") {
        sessionId.value = response.body["session_id"];
        //getChampions();
      } else {
        //deu falha na criação da session_id
        print(response.body["ret_msg"]);
      }
    } else {
      //deu falha na request
      print('Falha ao realizar a request CodStatus:${response.statusCode}');
      print('Falha ao realizar a request MSG:${response.body["ret_msg"]}');
    }
  }

  void loadingPadrao() {
    Get.dialog(
      Loading(),
      transitionDuration: Duration.zero,
      barrierDismissible: false,
    );
  }
}
