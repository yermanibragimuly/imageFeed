//
//  ProfilePresenterSpy.swift
//  ImageFeed
//
//  Created by Yerman Ibragimuly on 24.09.2024.
//

import ImageFeed
import Foundation

final class ProfilePresenterSpy: ProfilePresenterProtocol {
    var view: ImageFeed.ProfileViewControllerProtocol?
    var viewDidLoadCalled: Bool = false
    var viewDidClearAccount: Bool = false
    var viewDidAppearCalled: Bool = false

    func viewWillAppear() {
        viewDidAppearCalled = true
    }

    func viewDidLoad() {
        viewDidLoadCalled = true
    }

    func clearAccount() {
        viewDidClearAccount = true
    }


}
