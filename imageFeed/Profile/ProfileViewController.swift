//
//  ProfileViewController.swift
//  imageFeed
//
//  Created by Yerman Ibragimuly on 27.05.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    private var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileImage = UIImage(named: "avatar")
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        let descriptionLabelName = UILabel()
        descriptionLabelName.text = "Екатерина Новикова"
        descriptionLabelName.numberOfLines = 0
        descriptionLabelName.font = UIFont.boldSystemFont(ofSize: 23)
        descriptionLabelName.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        descriptionLabelName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabelName)
        descriptionLabelName.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        descriptionLabelName.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        descriptionLabelName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        self.label = descriptionLabelName
        
        let descriptionLabelLogin = UILabel()
        descriptionLabelLogin.text = "@ekaterina_nov"
        descriptionLabelLogin.numberOfLines = 0
        descriptionLabelLogin.textColor = UIColor(red: 174/255, green: 175/255, blue: 180/255, alpha: 1.0)
        descriptionLabelLogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabelLogin)
        descriptionLabelLogin.trailingAnchor.constraint(equalTo: descriptionLabelName.trailingAnchor).isActive = true
        descriptionLabelLogin.leadingAnchor.constraint(equalTo: descriptionLabelName.leadingAnchor).isActive = true
        descriptionLabelLogin.topAnchor.constraint(equalTo: descriptionLabelName.bottomAnchor, constant: 8).isActive = true
        self.label = descriptionLabelLogin
        
        let descriptionLabelStatus = UILabel()
        descriptionLabelStatus.text = "Hello, world!"
        descriptionLabelStatus.numberOfLines = 0
        descriptionLabelStatus.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        descriptionLabelStatus.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabelStatus)
        descriptionLabelStatus.trailingAnchor.constraint(equalTo: descriptionLabelLogin.trailingAnchor).isActive = true
        descriptionLabelStatus.leadingAnchor.constraint(equalTo: descriptionLabelLogin.leadingAnchor).isActive = true
        descriptionLabelStatus.topAnchor.constraint(equalTo: descriptionLabelLogin.bottomAnchor, constant: 8).isActive = true
        self.label = descriptionLabelStatus
        
        let button = UIButton.systemButton(
            with: UIImage(named: "logout_button")!,
            target: self,
            action: #selector(didTapButton)
        )
        button.tintColor = UIColor(red: 245/255, green: 107/255, blue: 108/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        button.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc func didTapButton() {
        for subview in view.subviews {
            if subview is UILabel {
                subview.removeFromSuperview()
            }
        }
    }
}

