//
//  SKWebView.m
//  haha
//
//  Created by housenkui on 2018/9/2.
//  Copyright © 2018年 com.meiniucn. All rights reserved.
//

#import "SKWebView.h"
#import "WKWebViewConfiguration+Console.h"

@interface WKWebView ()<WKScriptMessageHandler>

@end
@implementation SKWebView

- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration {
    
    if(self = [super initWithFrame:frame configuration:configuration])
    {
        if (configuration.showConsole) {
            WKUserContentController *userCC = configuration.userContentController;
            [userCC addScriptMessageHandler:self name:@"log"];
            [self showConsole];
        }
    
    }
    return self;
}
- (void)showConsole {
    
    //重写js的console.log函数的方法
    NSString *jsCode = @"console.log = (function(oriLogFunc){\
    return function(str)\
    {\
    window.webkit.messageHandlers.log.postMessage(str);\
    oriLogFunc.call(console,str);\
    }\
    })(console.log);";
    
    [self.configuration.userContentController addUserScript:[[WKUserScript alloc] initWithSource:jsCode injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES]];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"%@",message.body);
    
}

@end
