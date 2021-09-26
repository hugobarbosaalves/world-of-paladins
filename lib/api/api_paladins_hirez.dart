import 'package:get/get.dart';

class ApiPaladinsHirez extends GetConnect {
  Future<ApiPaladinsHirez> inicia() async {
    return this;
  }

  Future<Response> createSession(String url) => get(url);
  Future<Response> getChampions(String url) => get(url);
  Future<Response> getCardChampion(String url) => get(url);
}
