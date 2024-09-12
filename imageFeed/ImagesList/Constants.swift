import Foundation

enum Constants {
    static let accessKey = "Q44p1ozbkvY18J9EVE7gkO5tqyRy-YBwZCO8i6VivYQ"
    static let secretKey = "pSvOi0gGSFm0yWvOn9tLEtKr6JOEHSmJDDwMHiPoD3g"
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    static let defaultBaseURL = URL(string: "https://api.unsplash.com")!
    static let urlComponentsURLString = "https://unsplash.com/oauth/token"
}

enum WebViewConstants {
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
    static let urlComponentsPath = "/oauth/authorize/native"
}

enum OAuthConstants {
    static let baseURL = "https://unsplash.com"
}

enum ProfileConstants {
    static let urlProfilePath = "https://api.unsplash.com/me"
    static let urlUsersPath = "https://api.unsplash.com/users/"
}
