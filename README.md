  Aspect Oriented Programming(AOP) .
  Don't change javascript any code. All code write in native.
  Main idea: 
 
  1.rewrite the console.log method of javascript.       2.iOS native code injected the method when H5 starts to create the DOM tree.


```pod 'SKJavaScriptBridge', '~> 1.0.1'```

If native want to get console.log in WKWebView just
```[WKWebView enableLogging:LogginglevelAll];``` is enough.

Newer Demo https://github.com/housenkui/WebViewJavascriptBridge
