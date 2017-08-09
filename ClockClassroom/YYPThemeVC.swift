//
//  YYPThemeVC.swift
//  ClockClassroom
//
//  Created by YUYUNPENG on 2017/8/9.
//  Copyright © 2017年 YUYUNPENG. All rights reserved.
//

import UIKit
import WebKit

class YYPThemeVC: UIViewController,WKNavigationDelegate,WKUIDelegate {
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "主题";
        
        self.webView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self;
        
        let encodeStr = "\(H5BaseUrl)/\(KVersionH)/theme.html?uid="
        
        if let url = URL.init(string: encodeStr) {
            self.webView.load(URLRequest.init(url:url))
            self.view.addSubview(self.webView)
        }

    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
}
