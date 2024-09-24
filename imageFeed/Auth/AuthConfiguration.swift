
import Foundation

struct AuthConfiguration {
    static let standard = AuthConfiguration()

    let accessKey: String
    let secretKey: String
    let redirectURI: String
    let accessScope: String
    let baseURL: URL
    let tokenKey: String
    let authURLString: String

    private init() {
        self.accessKey = "CEryCnXH3ayPotJAzlhz3kFZveRcxNTlNB60nKlelG4"
        self.secretKey = "ESQKfWSaxeg_mPBiruMLJqetq-pakEYgvTo6Z5PE7BUs"
        self.redirectURI = "urn:ietf:wg:oauth:2.0:oob"
        self.accessScope = "public+read_user+write_likes+write_user"
        self.baseURL = URL(string: "https://api.unsplash.com")!
        self.tokenKey = "ImageFeedOAuth2Token"
        self.authURLString = "https://unsplash.com/oauth/authorize"
    }
}


