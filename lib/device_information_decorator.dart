part of 'device_information.dart';

/// A decorator for [DeviceInformation]
///
/// [T] is the type of the value to be decorated
/// oriInfo is the original [DeviceInformation] object
/// value is the value to be decorated
typedef DeviceInformationDecorator<T> = T Function(
    DeviceInformation oriInfo,
    T value,
    );

/// Decorators for [DeviceInformation]
class DeviceInformationDecorators {
  final DeviceInformationDecorator<String>? deviceId;
  final DeviceInformationDecorator<String>? osName;
  final DeviceInformationDecorator<String>? osVersion;
  final DeviceInformationDecorator<String>? softwareName;
  final DeviceInformationDecorator<String>? softwareVersion;
  final DeviceInformationDecorator<String>? applicationId;
  final DeviceInformationDecorator<String>? applicationType;
  final DeviceInformationDecorator<String>? applicationName;
  final DeviceInformationDecorator<String>? applicationVersion;
  final DeviceInformationDecorator<String>? applicationBuildCode;

  DeviceInformationDecorators({
    this.deviceId,
    this.osName,
    this.osVersion,
    this.softwareName,
    this.softwareVersion,
    this.applicationId,
    this.applicationType,
    this.applicationName,
    this.applicationVersion,
    this.applicationBuildCode,
  });
}

/// The extension methods for [DeviceInformation]
extension DeviceInformationExtension on DeviceInformation {
  /// Decorate the [DeviceInformation] object by providing decorators.
  ///
  DeviceInformation decoration({
    DeviceInformationDecorator<String>? deviceId,
    DeviceInformationDecorator<String>? osName,
    DeviceInformationDecorator<String>? osVersion,
    DeviceInformationDecorator<String>? softwareName,
    DeviceInformationDecorator<String>? softwareVersion,
    DeviceInformationDecorator<String>? applicationId,
    DeviceInformationDecorator<String>? applicationType,
    DeviceInformationDecorator<String>? applicationName,
    DeviceInformationDecorator<String>? applicationVersion,
    DeviceInformationDecorator<String>? applicationBuildCode,
  }) {
    var decorators = DeviceInformationDecorators(
      deviceId: deviceId,
      osName: osName,
      osVersion: osVersion,
      softwareName: softwareName,
      softwareVersion: softwareVersion,
      applicationId: applicationId,
      applicationType: applicationType,
      applicationName: applicationName,
      applicationVersion: applicationVersion,
      applicationBuildCode: applicationBuildCode,
    );

    return _clientInfoDecorationHandler(this, decorators);
  }
}

/// The handler for [DeviceInformation] decoration
///
/// [oriInfo] is the original [DeviceInformation] object
/// [decorators] is the decorators for [DeviceInformation]
DeviceInformation _clientInfoDecorationHandler(
    DeviceInformation oriInfo, DeviceInformationDecorators decorators) {
  var decoratedInfo = oriInfo;

  // device decoration
  if (decorators.deviceId != null) {
    decoratedInfo.deviceId =
        decorators.deviceId!(oriInfo, decoratedInfo.deviceId);
  }

  // os decoration
  if (decorators.osName != null) {
    decoratedInfo.osName = decorators.osName!(oriInfo, decoratedInfo.osName);
  }
  if (decorators.osVersion != null) {
    decoratedInfo.osVersion =
        decorators.osVersion!(oriInfo, decoratedInfo.osVersion);
  }

  // software decoration
  if (decorators.softwareName != null) {
    decoratedInfo.softwareName =
        decorators.softwareName!(oriInfo, decoratedInfo.softwareName);
  }
  if (decorators.softwareVersion != null) {
    decoratedInfo.softwareVersion =
        decorators.softwareVersion!(oriInfo, decoratedInfo.softwareVersion);
  }

  // application decoration
  if (decorators.applicationId != null) {
    decoratedInfo.applicationId =
        decorators.applicationId!(oriInfo, decoratedInfo.applicationId);
  }
  if (decorators.applicationType != null) {
    decoratedInfo.applicationType =
        decorators.applicationType!(oriInfo, decoratedInfo.applicationType);
  }
  if (decorators.applicationName != null) {
    decoratedInfo.applicationName =
        decorators.applicationName!(oriInfo, decoratedInfo.applicationName);
  }
  if (decorators.applicationVersion != null) {
    decoratedInfo.applicationVersion = decorators.applicationVersion!(
        oriInfo, decoratedInfo.applicationVersion);
  }
  if (decorators.applicationBuildCode != null) {
    decoratedInfo.applicationBuildCode = decorators.applicationBuildCode!(
        oriInfo, decoratedInfo.applicationBuildCode);
  }

  return decoratedInfo;
}