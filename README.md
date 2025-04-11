# Device Client Information

This is a plugin that lets you get basic information from your application's client. It's easy to use and supports different platforms (Android). There are four different information types: "application information", "software information", "operating system information", and "device information".

## Information Types

There are 4 different types:

1. Application Information
2. Software Information
3. Operating System Information
4. Device Information

### Application Information

Application information is all about the application you build. And notice that **applicationId** is not supported for web applications.

<table>
  <tr>
    <td>Attribute</td>
    <td>Android</td>
  </tr>
  <tr>
    <td><b>applicationId</b><br>String</td>
    <td>⭕<br>package name</td>
  </tr>
  <tr>
    <td><b>applicationType</b><br>String (app/web)</td>
    <td>⭕</td>
  </tr>
  <tr>
    <td><b>applicationName</b><br>String</td>
    <td>⭕</td>
  </tr>
  <tr>
    <td><b>applicationVersion</b><br>String</td>
    <td>⭕</td>
  </tr>
  <tr>
    <td><b>applicationBuildCode</b><br>String</td>
    <td>⭕</td>
  </tr>
</table><br>

### Software Information

"Software" stands for the "software" that runs your application, such as "Operating System" for iOS/Android projects or "Browser" for web projects.

<table>
  <tr>
    <td>Attribute</td>
    <td>Android</td>
  </tr>
  <tr>
    <td><b>softwareName</b><br>String</td>
    <td>⭕<br>OS name</td>
  </tr>
  <tr>
    <td><b>softwareVersion</b><br>String</td>
    <td>⭕<br>OS version</td>
  </tr>
</table><br>

### Operating System Information

OS information will show you the OS's name and version. Notice: Web projects may not get this information if the browser's user-agent doesn't contain any information about the operating system.

<table>
  <tr>
    <td>Attribute</td>
    <td>Android</td>
  </tr>
  <tr>
    <td><b>osName</b><br>String</td>
    <td>⭕<br>OS name</td>
  </tr>
  <tr>
    <td><b>osVersion</b><br>String</td>
    <td>⭕<br>OS version</td>
  </tr>
  <tr>
    <td><b>osVersionCode</b><br>String</td>
    <td>⭕<br>Android API level</td>
  </tr>
</table><br>

### Device Information

The device information will display device's ID and name. Note that web projects don't support real **deviceId**, so they will use the package [uuid](https://pub.dev/packages/uuid) to generate a unique string and save to the browser's cookie.

<table>
  <tr>
    <td>Attribute</td>
    <td>Android</td>
  </tr>
  <tr>
    <td><b>deviceId</b><br>String</td>
    <td>⭕</td>
  </tr>
  <tr>
    <td><b>deviceName</b><br>String</td>
    <td>⭕</td>
  </tr>
</table><br>

## Getting Started

In the pubspec.yaml of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  device_client_information: ^0.0.1
```

In your project add the following import:

```dart
import 'package:client_information/client_information.dart';
```

Then, you can get information like this:

```dart
// Get client information
DeviceInformation info = await DeviceInformation.fetch();

print(info.deviceId); // EA625164-4XXX-XXXX-XXXXXXXXXXXX
print(info.osName); // iOS
```

## Decoration

Starting from version 2.1.0, you can customize some information by passing the `decorators`. Like below:

```dart
var information = await DeviceInformation.fetch(
      // you can pass decorators to decoration the value before it return.
      decorators: ClientInformationDecorators(
        deviceId: (oriInfo, value) =>
            'prefix-$value-${oriInfo.applicationName}',
      ),
    );
```

Or, you can use extension method like this:

```dart
var information = await DeviceInformation.fetch();
print('Original DeviceId: ${information.deviceId}');
// Original DeviceId: EA625164-4XXX-XXXX-XXXXXXXXXXXX

var decoratedInfo = information.decoration(deviceId: (oriInfo, value) => '$value-some-suffix-string-here');
print('Decorated DeviceId: ${decoratedInfo.deviceId}');
// Decorated DeviceId: EA625164-4XXX-XXXX-XXXXXXXXXXXX-some-suffix-string-here
```

## Mock Data for Test

Starting from version 1.0.2, you can mock data or enable "mockMode" to facilitate testing. Here is how to set it up:

<br>

In your test file:

```dart
setUp(() async {
  // Change to "MockMode" and set the default data you need.
  DeviceInformation.mockOn(
      deviceId: 'mock_device_id', osName: 'MyCustomOS');
});

tearDown(() {
  // Close the "MockMode" in tearDown method
  DeviceInformation.mockOff();
});

// Run your test
test('`deviceId` will be "mock_device_id"', () async {
DeviceInformation info = await DeviceInformation.fetch();
  expect(info.deviceId, 'mock_device_id');
});
```