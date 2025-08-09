import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_info/platform_info.dart';
import 'package:sheba_ai/data/repository/source/local/core_local_data_source.dart';

class CoreLocalDataSourceImpl implements CoreLocalDataSource {
  CoreLocalDataSourceImpl();

  @override
  String getPlatform() {
    return Platform.I.android ? 'Android' : 'iOS';
  }

  @override
  String getOperatingSystem() {
    return switch (platform.operatingSystem) {
      OperatingSystem$Android() => 'Android',
      OperatingSystem$Fuchsia() => 'Fuchsia',
      OperatingSystem$iOS() => 'iOS',
      OperatingSystem$Linux() => 'Linux',
      OperatingSystem$MacOS() => 'macOS',
      OperatingSystem$Windows() => 'Windows',
      OperatingSystem$Unknown() => 'Unknown',
    };
  }

  @override
  String getLocaleName() => platform.locale;

  @override
  Future<String> getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  @override
  Future<String> getApkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  @override
  String getTimeZone() {
    return DateTime.now().timeZoneName;
  }
}
