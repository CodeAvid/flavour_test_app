enum Flavor {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'Flavor App Dev';
      case Flavor.STAGING:
        return 'Flavor App Staging';
      case Flavor.PRODUCTION:
        return 'Counter App Production';
      default:
        return 'title';
    }
  }

}
