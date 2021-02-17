//
//  WebView.swift
//  NewsApp
//
//  Created by Mustafa on 16.02.2021.
//

import SwiftUI
import WebKit
import SwiftyJSON

struct webView : UIViewRepresentable {
    
    var url : String
    
    func makeUIView(context: UIViewRepresentableContext<webView>) -> WKWebView {
        
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<webView>) {
        
    }
}
