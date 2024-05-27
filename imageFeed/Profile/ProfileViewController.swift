//
//  ProfileViewController.swift
//  imageFeed
//
//  Created by Yerman Ibragimuly on 27.05.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var loginNameLable: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var logoutButton: UIButton!
    
    @IBAction private func didTapLogoutButton() {
    }
}
