#import "FlutterAmapPlugin.h"
#if __has_include(<flutter_amap/flutter_amap-Swift.h>)
#import <flutter_amap/flutter_amap-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_amap-Swift.h"
#endif

@implementation FlutterAmapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAmapPlugin registerWithRegistrar:registrar];
}
@end
