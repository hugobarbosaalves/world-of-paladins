import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:world_of_paladins/services/utils.dart';

class ApiPaladinsHirez extends GetConnect {
  String devKey = '3712'; // devKey goes here
  String authKey = 'A95E29F9212A4155988E6DB70036A290'; // authKey goes here
  //string urlPrefix = "http://api.smitegame.com/smiteapi.svc/";
  String urlPrefix = 'https://api.paladins.com/paladinsapi.svc/';
  String lg = '10';

  Future<List?> getCardChampion({required String sessionId, required int champId}) async {
    var assina = getAssinatura(path: 'getchampioncards');
    String concat = getTimestamp();
    var url = '${urlPrefix}getchampioncardsjson/$devKey/$assina/$sessionId/$concat/$champId/$lg';
    var response = await get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Falha ao realizar a request CodStatus:${response.statusCode}');
      // print('Falha ao realizar a request MSG:${response.body["ret_msg"]}');
      return null;
    }
  }

  Future<String?> createSession() async {
    var assina = getAssinatura(path: 'createsession');
    String concat = getTimestamp();
    var url = '${urlPrefix}createsessionJson/$devKey/$assina/$concat';
    var response = await get(url);
    if (response.isOk) {
      if (response.body["ret_msg"] == "Approved") {
        return response.body["session_id"];
      } else {
        //deu falha na criação da session_id
        print(response.body["ret_msg"]);
        return null;
      }
    } else {
      //deu falha na request
      print('Falha ao realizar a request CodStatus:${response.statusCode}');
      print('Falha ao realizar a request MSG:${response.body["ret_msg"]}');
      return null;
    }
  }

  Future<List?> getChampions({required String sessionId}) async {
    var assina = getAssinatura(path: 'getchampions');
    String concat = getTimestamp();
    var url = '${urlPrefix}getchampionsjson/$devKey/$assina/$sessionId/$concat/$lg';
    var response = await get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Falha ao realizar a request CodStatus:${response.statusCode}');
      // print('Falha ao realizar a request MSG:${response.body["ret_msg"]}');
      return null;
    }
  }

  String getAssinatura({required String path}) {
    var signature = '$devKey$path$authKey${DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc())}';
    return Utils.getMD5(signature);
  }

  String getTimestamp() {
    return DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc());
  }
}
