
import UIKit

struct UserResult: Codable {
    let profileImage: ImageURL?
}

struct ImageURL: Codable {
    let small: String
}
