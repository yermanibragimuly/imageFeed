//
//  AuthViewController.swift
//  imageFeed
//
//  Created by Yerman Ibragimuly on 05.06.2024.
//

import UIKit

//MARK: - AuthViewControllerDelegate
protocol AuthViewControllerDelegate: AnyObject {
    func authViewController(_ vc: AuthViewController, didAuthenticateWithCode code: String)
}

//MARK: - AuthViewController
final class AuthViewController: UIViewController {
    
    //MARK: - Public Properties
    weak var delegate: AuthViewControllerDelegate?
    
    //MARK: - Private properties
    private let ShowWebViewSegueIdentifier = "ShowWebView"
    private let oauth2Service = OAuth2Service.shared
    private var authorizationLogoImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAuthorizationLogoImageView()
        
    }
    
    
    //MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ShowWebViewSegueIdentifier {
            guard
                let webViewViewController = segue.destination as? WebViewController
            else { fatalError("Failed to prepare for \(ShowWebViewSegueIdentifier)") }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
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

//MARK: - WebViewViewControllerDelegate
extension AuthViewController: WebViewViewControllerDelegate {
    
    //MARK: - Public Methods
    func webViewViewControllerDidCancel(_ vc: WebViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func webViewViewController(_ vc: WebViewController, didAuthenticateWithCode code: String) {
        delegate?.authViewController(self, didAuthenticateWithCode: code)
    }
}
