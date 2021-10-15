import 'package:fluttertoast/fluttertoast.dart';
import 'package:thai59/model/code.dart';
import 'package:thai59/service/config.dart';
import 'package:thai59/utils/expand_util.dart';
import 'http_request.dart';

class LoginRequest {
  static Future<CodeResult?> sendCode(Map<String, String> dataMap) async {
    final result =await HttpRequest.request(Path.sendSms, params: dataMap.create);
    var codeR = CodeResult.fromJson(result);
    print("codeR $codeR");
    if (codeR.code == "200") {
      return codeR;
    } else {
      toast(codeR.message);
      return null;
    }
  }
}
