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
  final String displayName;

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
    required this.displayName,
  });

  FlavorConfig.production()
      : this._(
          baseUrl: 'http://jsonplaceholder.typicode.com/',
          displayName: 'DOT Base Flutter',
        );

  FlavorConfig.staging()
      : this._(
          baseUrl: 'http://jsonplaceholder.typicode.com/',
          displayName: 'DOT Base Flutter STAGING',
        );

  FlavorConfig.development()
      : this._(
          baseUrl: 'http://jsonplaceholder.typicode.com/',
          displayName: 'DOT Base Flutter DEV',
        );

  Map toJson() => {
        'baseUrl': baseUrl,
        'displayName': displayName,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
