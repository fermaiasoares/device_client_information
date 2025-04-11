import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_client_information_method_channel.dart';

abstract class DeviceClientInformationPlatform extends PlatformInterface {
  /// Constructs a DeviceClientInformationPlatform.
  DeviceClientInformationPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceClientInformationPlatform _instance = MethodChannelDeviceClientInformation();

  /// The default instance of [DeviceClientInformationPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceClientInformation].
  static DeviceClientInformationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceClientInformationPlatform] when
  /// they register themselves.
  static set instance(DeviceClientInformationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<dynamic> getInformation() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
