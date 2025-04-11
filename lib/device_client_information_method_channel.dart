import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_client_information_platform_interface.dart';

/// An implementation of [DeviceClientInformationPlatform] that uses method channels.
class MethodChannelDeviceClientInformation extends DeviceClientInformationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_client_information');

  @override
  Future<dynamic> getInformation() async {
    final version = await methodChannel.invokeMethod<dynamic>('getInformation');
    return version;
  }
}
