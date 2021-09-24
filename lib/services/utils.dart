import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class Utils extends GetxService {
  Future<Utils> inicia() async {
    return this;
  }

  String getMD5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
