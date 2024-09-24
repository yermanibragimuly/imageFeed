//
//  AuthConfiguration.swift
//  ImageFeed
//
//  Created by Yerman Ibragimuly on 24.09.2024.
//

import Foundation

let AccessKey = "Q44p1ozbkvY18J9EVE7gkO5tqyRy-YBwZCO8i6VivYQ"
let SecretKey = "pSvOi0gGSFm0yWvOn9tLEtKr6JOEHSmJDDwMHiPoD3g"
let RedirectURI = "urn:ietf:wg:oauth:2.0:oob"
let AccessScope = "public+read_user+write_likes+write_user"
let DefaultBaseURL = URL(string: "https://api.unsplash.com")!
let TokenKey = "ImageFeedOAuth2Token"

fileprivate let UnsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"

struct AuthConfiguration {
    let accessKey: String
    let secretKey: String
    let redirectURI: String
    let accessScope: String
    let defaultBaseURL: URL
    let authURLString: String

    init(accessKey: String,
         secretKey: String,
         redirectURI: String,
         accessScope: String,
         defaultBaseURL: URL,
         authURLString: String)
    {
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.redirectURI = redirectURI
        self.accessScope = accessScope
        self.defaultBaseURL = defaultBaseURL
        self.authURLString = authURLString
    }

    static var standard: AuthConfiguration {
        return AuthConfiguration(accessKey: AccessKey,
                                 secretKey: SecretKey,
                                 redirectURI: RedirectURI,
                                 accessScope: AccessScope,
                                 defaultBaseURL: DefaultBaseURL,
                                 authURLString: UnsplashAuthorizeURLString)
    }
}
