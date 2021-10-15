
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thai59/service/config.dart';

extension createCommonParams on Map<String, String>{
  Map<String, String> get create {
    this["app_version"] = PackConfig.version;
    this["appversion"] = PackConfig.version;
    this["version"] = "1.0";
    this["channel"] = "1";
    this["imei"] = PackConfig.uuid;
    this["timestamp"] = DateTime.now().millisecond.toString();
    this["pkg_name"] = PackConfig.packageName;
    this["sign"] = "test";
    return this;
  }
}

toast(String? message){
  if (message!=null) {
    Fluttertoast.showToast(msg: message);
  }
}

extension BoolExt on bool {
  bool not() {
    return !this;
  }

  bool and(bool val) {
    return this && val;
  }

  bool or(bool val) {
    return this || val;
  }
}


