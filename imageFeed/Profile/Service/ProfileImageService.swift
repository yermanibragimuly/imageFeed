
import Foundation
import Kingfisher

final class ProfileImageService {

    static let shared = ProfileImageService()
    static let didChangeNotification = Notification.Name(rawValue: "ProfileImageProviderDidChange")
    private (set) var avatarURL: URL?
    private var currentTask: URLSessionTask?

    private init(
        avatarURL: URL? = nil,
        currentTask: URLSessionTask? = nil
    ) {
        self.avatarURL = avatarURL
        self.currentTask = currentTask
    }

    func fetchProfileImageURL(username: String,
                              _ completion: @escaping (Result<String, Error>) -> Void) {
        assert(Thread.isMainThread)

        guard let request = makeRequest(username: username) else { return }
        let session = URLSession.shared
        let task = session.objectTask(for: request) { [weak self]
            (result: Result<UserResult, Error>) in
            guard let self = self else { return }

            switch result {
            case .success(let profilePhoto):
                guard let smallPhoto = profilePhoto.profileImage?.small else { return }
                self.avatarURL = URL(string: smallPhoto)
                completion(.success(smallPhoto))
                NotificationCenter.default.post(
                    name: ProfileImageService.didChangeNotification,
                    object: self,
                    userInfo: ["URL": smallPhoto]
                )
            case .failure(let error):
                completion(.failure(error))
            }
            self.currentTask = nil
        }
        self.currentTask = task
        task.resume()
    }

    private func makeRequest(username: String) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.path = "/users/\(username)"
        urlComponents.queryItems = [URLQueryItem(name: "client_id", value: AuthConfiguration.standard.accessKey)]

        guard let url = urlComponents.url else {
            fatalError("Failed to create Avatar URL")
        }

        var request = URLRequest(url: url)

        request.httpMethod = "GET"

        if let token = OAuth2TokenStorage.shared.token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
}



