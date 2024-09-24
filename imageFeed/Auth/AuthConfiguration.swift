
import Foundation

struct AuthConfiguration {
    static let standard = AuthConfiguration()

    let accessKey: String
    let secretKey: String
    let redirectURI: String
    let accessScope: String
    let baseURL: URL
    let tokenKey: String
    var authURLString: String {
            return "https://unsplash.com/oauth/authorize"
        }

    private init() {
        self.accessKey = "Q44p1ozbkvY18J9EVE7gkO5tqyRy-YBwZCO8i6VivYQ"
        self.secretKey = "pSvOi0gGSFm0yWvOn9tLEtKr6JOEHSmJDDwMHiPoD3g"
        self.redirectURI = "urn:ietf:wg:oauth:2.0:oob"
        self.accessScope = "public+read_user+write_likes+write_user"
        self.baseURL = URL(string: "https://api.unsplash.com")!
        self.tokenKey = "ImageFeedOAuth2Token"
    }
}


