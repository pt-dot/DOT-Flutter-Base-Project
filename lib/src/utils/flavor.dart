enum Flavor {
  development,
  staging,
  production,
}

extension FlavorExtension on Flavor {
  String get value {
    switch (this) {
      case Flavor.production:
        return 'production';
      case Flavor.staging:
        return 'staging';
      default:
        return 'development';
    }
  }
}

class FlavorConfig {

  final String baseUrl;

  factory FlavorConfig(Flavor flavor) {
    if (flavor == Flavor.production) {
      return FlavorConfig.production();
    } else if (flavor == Flavor.staging) {
      return FlavorConfig.staging();
    } else {
      return FlavorConfig.development();
    }
  }

  const FlavorConfig._({
    required this.baseUrl,
  });

  FlavorConfig.production(): this._(
    baseUrl: 'http://jsonplaceholder.typicode.com/'
  );

  FlavorConfig.staging(): this._(
      baseUrl: 'http://jsonplaceholder.typicode.com/'
  );

  FlavorConfig.development(): this._(
      baseUrl: 'http://jsonplaceholder.typicode.com/'
  );

  Map toJson() => {
    'baseUrl': baseUrl,
  };

  @override
  String toString() {
    return toJson().toString();
  }

}