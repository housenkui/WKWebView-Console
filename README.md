# WKWebView-Console
WKWebView监听js的console.log打印


主要思路：
1.重写js的console.log方法。
2.iOS端在h5开始创建DOM树的时候注入。
