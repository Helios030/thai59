class HttpConfig {
  static const String baseURL = "http://api.th.golden-union.top/api/";
  static const int timeout = 5000;
}

class Path{
  static const String sendSms = "register/app/sendSms";
}
  class PackConfig{
 static String appName="";
 static String packageName="";
 static String version="";
 static String buildNumber="";
 static String uuid="";

 @override
  String toString() {
    return 'PackConfig{ appName$appName  packageName $packageName version $version  buildNumber $buildNumber uuid $uuid }';
 }
}