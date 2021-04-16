//
//  StoreViewModel.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 4/16/21.
//

import Foundation
import WebKit

class StoreViewModel: ObservableObject {
    @Published var storeURL = "https://avocadoge.square.site"
    
    @Published var showProgressBar = false
    @Published var progress: Float = 0.0
    
    private var progressObserver: NSKeyValueObservation?
    private var loadingObserver: NSKeyValueObservation?
    
    deinit {
        progressObserver?.invalidate()
        progressObserver = nil
        loadingObserver?.invalidate()
        loadingObserver = nil
    }
    
    private func updateWebViewProgress(webView: WKWebView) {
        progress = Float(webView.estimatedProgress)
    }
    
    private func updateWebViewLoading(webView: WKWebView) {
        showProgressBar = webView.isLoading
    }
}

extension StoreViewModel: WebViewDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func setObservers(webView: WKWebView) {
        progressObserver = webView.observe(\.estimatedProgress) { [weak self] webView, _ in
            self?.updateWebViewProgress(webView: webView)
        }

        loadingObserver = webView.observe(\.isLoading) { [weak self] webView, _ in
            self?.updateWebViewLoading(webView: webView)
        }
    }
}
