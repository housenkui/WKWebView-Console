//
//  WKWebViewConfiguration+Console.m
//  haha
//
//  Created by housenkui on 2018/9/2.
//  Copyright © 2018年 com.meiniucn. All rights reserved.
//
#import "WKWebViewConfiguration+Console.h"
#import <objc/runtime.h>

static const void *associateKey = "associateKey";

@implementation WKWebViewConfiguration (Console)

- (void)setShowConsole:(BOOL)showConsole {
        objc_setAssociatedObject(self, associateKey, @(showConsole), OBJC_ASSOCIATION_ASSIGN);
}
- (BOOL)showConsole {
     NSNumber *numberValue = objc_getAssociatedObject(self, associateKey);
     return [numberValue boolValue];
}
@end
