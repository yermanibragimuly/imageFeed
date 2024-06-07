//
//  WebViewController.swift
//  imageFeed
//
//  Created by Yerman Ibragimuly on 05.06.2024.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    
    @IBOutlet private var webView: WKWebView!
    
    @IBAction func didTapBackButton(_ sender: Any) {
        
    }
    
    enum WebViewConstants {
        static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
    }
    
    private func loadAuthView() {
        guard var urlComponents = URLComponents(string: WebViewConstants.unsplashAuthorizeURLString) else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: Constants.accessScope)
        ]
        guard let url = urlComponents.url else {
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAuthView()
        
    }
    
    
}
