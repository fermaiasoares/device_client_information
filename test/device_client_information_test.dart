import 'package:flutter_test/flutter_test.dart';
import 'package:device_client_information/device_client_information.dart';
import 'package:device_client_information/device_client_information_platform_interface.dart';
import 'package:device_client_information/device_client_information_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockDeviceClientInformationPlatform
//     with MockPlatformInterfaceMixin
//     implements DeviceClientInformationPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

void main() {
  final DeviceClientInformationPlatform initialPlatform = DeviceClientInformationPlatform.instance;

  // test('$MethodChannelDeviceClientInformation is the default instance', () {
  //   expect(initialPlatform, isInstanceOf<MethodChannelDeviceClientInformation>());
  // });

  // test('getInformation', () async {
  //   DeviceClientInformation deviceClientInformationPlugin = DeviceClientInformation();
  //   MockDeviceClientInformationPlatform fakePlatform = MockDeviceClientInformationPlatform();
  //   DeviceClientInformationPlatform.instance = fakePlatform;
  //
  //   expect(await deviceClientInformationPlugin.getPlatformVersion(), '42');
  // });
}
