
import Foundation

enum NetworkError: Error {

    case decodingError(Error)
    case urlRequestError(Error)
    case urlSessionError
    case httpStatusCode(Int)
    case invalidStatusCode
    case invalidRequest
    case noData
    case unauthorized
}
