#import "XamapPlugin.h"
#if __has_include(<xamap/xamap-Swift.h>)
#import <xamap/xamap-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "xamap-Swift.h"
#endif

@implementation XamapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftXamapPlugin registerWithRegistrar:registrar];
}
@end
