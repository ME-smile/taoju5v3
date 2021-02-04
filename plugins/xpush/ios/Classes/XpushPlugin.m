#import "XpushPlugin.h"
#if __has_include(<xpush/xpush-Swift.h>)
#import <xpush/xpush-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "xpush-Swift.h"
#endif

@implementation XpushPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftXpushPlugin registerWithRegistrar:registrar];
}
@end
