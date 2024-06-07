//
//  AuthViewController.swift
//  imageFeed
//
//  Created by Yerman Ibragimuly on 05.06.2024.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private let ShowWebViewSegueIdentifier = "ShowWebView"
    
    private var authorizationLogoImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAuthorizationLogoImageView()
        
    }
    
    private func setupAuthorizationLogoImageView() {
        let autorizationLogo = UIImage(named: "auth_screen_logo")
        let imageView = UIImageView(image: autorizationLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        self.authorizationLogoImageView = imageView
    }
    
}
