import Foundation
import Alamofire

enum Router {
    // MARK: BASEURL
    private static let baseURL = URL(string: "http://www.omdbapi.com")!
    
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
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = info.method.rawValue
        
        var parameters = info.parameters ?? [:]
        parameters["apikey"] = apiKey
        
        switch info.method {
        case .put, .post:
            urlRequest = try! JSONEncoding.default.encode(urlRequest, with: parameters)
        default:
            urlRequest = try! URLEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
}
