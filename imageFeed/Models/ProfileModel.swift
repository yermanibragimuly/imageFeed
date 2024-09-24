
import Foundation

public struct Profile {
    let userName: String
    public let name: String
    public let loginName: String
    public let bio: String?
    
    
    init(callData: ProfileResult) {
        self.userName = callData.userName
        self.name = (callData.firstName) + " " + (callData.lastName ?? "")
        self.loginName = "@" + (callData.userName )
        self.bio = callData.bio
    }
}
