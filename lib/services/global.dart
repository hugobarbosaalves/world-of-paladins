import 'package:get/get.dart';
import 'package:world_of_paladins/api/api_paladins_hirez.dart';
import 'package:world_of_paladins/services/utils.dart';
import 'package:world_of_paladins/widgets/load_padrao.dart';

class Global extends GetxService {
  var sessionId = ''.obs;
  final api = ApiPaladinsHirez();
  final utils = Utils();

  Future<Global> inicia() async {
    return this;
  }

  Future<void> createSession() async {
    var response = await api.createSession();
    if (response != null) {
      sessionId.value = response;
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
