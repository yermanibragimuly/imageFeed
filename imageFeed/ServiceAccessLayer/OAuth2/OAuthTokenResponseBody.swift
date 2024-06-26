//
//  OAuthTokenResponseBody.swift
//  imageFeed
//
//  Created by Yerman Ibragimuly on 25.06.2024.
//

import Foundation

struct OAuthTokenResponseBody: Codable {
    let accessToken: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
