import 'package:get/get.dart';
import 'package:world_of_paladins/widgets/load_padrao.dart';

class Global extends GetxService {
  String devKey = '3712'; // devKey goes here
  String authKey = 'A95E29F9212A4155988E6DB70036A290'; // authKey goes here
  //string urlPrefix = "http://api.smitegame.com/smiteapi.svc/";
  String urlPrefix = 'https://api.paladins.com/paladinsapi.svc/';
  var sessionId = ''.obs;

  Future<Global> inicia() async {
    return this;
  }

  void loadingPadrao() {
    Get.dialog(
      Loading(),
      transitionDuration: Duration.zero,
      barrierDismissible: false,
    );
  }
}
