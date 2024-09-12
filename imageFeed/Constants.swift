//
//  Constants.swift
//  imageFeed
//
//  Created by Yerman Ibragimuly on 26.06.2024.
//

import Foundation

enum Constants {
    static let accessKey = "Q44p1ozbkvY18J9EVE7gkO5tqyRy-YBwZCO8i6VivYQ"
    static let secretKey = "pSvOi0gGSFm0yWvOn9tLEtKr6JOEHSmJDDwMHiPoD3g"
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    static let defaultBaseURL = URL(string: "https://unsplash.com/")!
    static let authPath: String = "oauth/token/"
    static let apiURL = URL(string: "https://api.unsplash.com/")
}

enum WebViewConstants {
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
}
