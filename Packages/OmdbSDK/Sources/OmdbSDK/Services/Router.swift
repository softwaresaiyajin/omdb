import Foundation
import Alamofire

enum Router {
    // MARK: BASEURL
    private static let baseURL = URL(string: "https://www.omdbapi.com")!
    
    // MARK: EndPoints
    case getMovieItem(filter: MovieItemFilter)
    case getMovieCollection(filter: MovieCollectionFilter)
}

// MARK: RouteInfo
private extension Router {
    var routeInfo: RequestRoute {
        switch self {
        case .getMovieItem(let filter):
            return .init(method: .get, path: "", payload: filter)
        case .getMovieCollection(let filter):
            return .init(method: .get, path: "", payload: filter)
        }
    }
}

// MARK: URLRequestConvertible
extension Router: OmdbURLRequestConvertible {
    func asURLRequest(apiKey: String) -> URLRequest {
        let info = routeInfo
        let url = Self.baseURL.appendingPathComponent(info.path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            .init(name: "apikey", value: apiKey)
        ]

        var urlRequest = URLRequest(url: try! components.asURL())
        urlRequest.method = info.method

        switch info.method {
        case .put, .post:
            urlRequest = try! JSONEncoding.default.encode(urlRequest, with: info.parameters)
        default:
            urlRequest = try! URLEncoding.default.encode(urlRequest, with: info.parameters)
        }

        return urlRequest
    }
}
