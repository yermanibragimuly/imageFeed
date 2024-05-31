//
//  ProfileViewController.swift
//  imageFeed
//
//  Created by Yerman Ibragimuly on 27.05.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var profileImageView: UIImageView?
    private var nameLabel: UILabel?
    private var loginLabel: UILabel?
    private var statusLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProfileImageView()
        setupNameLabel()
        setupLoginLabel()
        setupStatusLabel()
        setupLogoutButton()
        
    }
    private func setupProfileImageView() {
        let profileImage = UIImage(named: "avatar")
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.profileImageView = imageView
        
    }
    
    private func setupNameLabel() {
        let nameLabel = UILabel()
        nameLabel.text = "Екатерина Новикова"
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.boldSystemFont(ofSize: 23)
        nameLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView!.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView!.bottomAnchor, constant: 8)
        ])
        
        self.nameLabel = nameLabel
        
    }
    
    private func setupLoginLabel(){
        let loginLabel = UILabel()
        loginLabel.text = "@ekaterina_nov"
        loginLabel.numberOfLines = 0
        loginLabel.textColor = UIColor(red: 174/255, green: 175/255, blue: 180/255, alpha: 1.0)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginLabel)
        
        NSLayoutConstraint.activate([
            loginLabel.trailingAnchor.constraint(equalTo: nameLabel!.trailingAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: nameLabel!.leadingAnchor),
            loginLabel.topAnchor.constraint(equalTo: nameLabel!.bottomAnchor, constant: 8)
        ])
        
        self.loginLabel = loginLabel
        
    }
    
    private func setupStatusLabel(){
        let statusLabel = UILabel()
        statusLabel.text = "Hello, world!"
        statusLabel.numberOfLines = 0
        statusLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            statusLabel.trailingAnchor.constraint(equalTo: loginLabel!.trailingAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: loginLabel!.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: loginLabel!.bottomAnchor, constant: 8)
        ])
        
        self.statusLabel = statusLabel
    }
    private func setupLogoutButton(){
        let logoutButton = UIButton.systemButton(
            with: UIImage(named: "logout_button")!,
            target: self,
            action: #selector(didTapButton)
        )
        
        logoutButton.tintColor = UIColor(red: 245/255, green: 107/255, blue: 108/255, alpha: 1.0)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            logoutButton.centerYAnchor.constraint(equalTo: profileImageView!.centerYAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 44),
            logoutButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    @objc func didTapButton() {
        for subview in view.subviews {
            if subview is UILabel {
                subview.removeFromSuperview()
            }
        }
        func updateNameLabel(text: String) {
            nameLabel?.text = text
        }
        
        func updateLoginLabel(text: String) {
            loginLabel?.text = text
        }
        
        func updateStatusLabel(text: String) {
            statusLabel?.text = text
        }
        
        func updateProfileImage(image: UIImage) {
            profileImageView?.image = image
        }
    }
}

