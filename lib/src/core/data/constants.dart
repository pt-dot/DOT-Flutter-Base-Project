
mixin URLs {
  static const String host = 'http://jsonplaceholder.typicode.com/';
  static const String assets = '${host}assets';
}


// constant for page limit & timeout
mixin AppLimit {
  static const int REQUEST_TIME_OUT = 30000;
  static const int ALBUM_PAGE_SIZE = 18;
  static const int POST_PAGE_SIZE =  100;
}

const String sentryDSN = '';
const String appVersion = '0.0.1';
const String environment = 'Production';
