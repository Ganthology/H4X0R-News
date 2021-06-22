//
//  WebView.swift
//  H4X0R News
//
//  Created by Boon Kit Gan on 21/06/2021.
//

import Foundation
import WebKit
import SwiftUI

// Create a UIView that represent UIKit View
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
