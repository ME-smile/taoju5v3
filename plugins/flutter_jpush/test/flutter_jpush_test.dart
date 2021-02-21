/*
 * @Description: jpush
 * @Author: iamsmiling
 * @Date: 2021-02-05 09:54:48
 * @LastEditTime: 2021-02-05 09:56:50
 */
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/flutter_jpush.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_jpush');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterJpush.platformVersion, '42');
  });
}
