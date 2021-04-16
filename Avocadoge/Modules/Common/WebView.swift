//
//  WebView.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/10/21.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import WebKit

enum URLType {
    case local(resource: String, urlExtension: String, subdirectory: String)
    case web(url: String)
}

protocol WebViewDelegate: AnyObject {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView)
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!)
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    func setObservers(webView: WKWebView)
}

struct WebView: UIViewRepresentable {
    
    var url: URLType
    weak var delegate: WebViewDelegate?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        delegate?.setObservers(webView: webView)
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        switch url {
        case .local(let resource, let urlExtension, let subdirectory):
            guard let url = Bundle.main.url(forResource: resource, withExtension: urlExtension, subdirectory: subdirectory) else { break }
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        case .web(let url):
            guard let url = URL(string: url) else { break }
            webView.load(URLRequest(url: url))
        }
    }
    
    class Coordinator : NSObject, WKNavigationDelegate {
        var parent: WebView
        weak var delegate: WebViewDelegate?
        
        init(_ parent: WebView) {
            self.parent = parent
            delegate = parent.delegate
        }
        
        // MARK: WKNavigationDelegate
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            delegate?.webView(webView, didFinish: navigation)
        }
        
        func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
            delegate?.webViewWebContentProcessDidTerminate(webView)
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            delegate?.webView(webView, didFail: navigation, withError: error)
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            delegate?.webView(webView, didCommit: navigation)
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            delegate?.webView(webView, didStartProvisionalNavigation: navigation)
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let delegate = delegate else {
                decisionHandler(.allow)
                return
            }
            delegate.webView(webView, decidePolicyFor: navigationAction, decisionHandler: decisionHandler)
        }
    }
}
