import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_client_information/device_client_information_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDeviceClientInformation platform = MethodChannelDeviceClientInformation();
  const MethodChannel channel = MethodChannel('device_client_information');

  // setUp(() {
  //   TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
  //     channel,
  //     (MethodCall methodCall) async {
  //       return '42';
  //     },
  //   );
  // });

  // tearDown(() {
  //   TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  // });

  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });
}
