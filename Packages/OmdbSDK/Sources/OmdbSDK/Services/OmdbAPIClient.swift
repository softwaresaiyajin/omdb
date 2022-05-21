import Alamofire
import Combine
import Foundation

protocol OmdbURLRequestConvertible {
    func asURLRequest(apiKey: String) -> URLRequest
}

public final class OmdbAPIClient {
    private let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func doRequest<
        Request: OmdbURLRequestConvertible,
        Response: Decodable
    >(_ request: Request) -> AnyPublisher<Response, Error> {
        AF
            .request(request.asURLRequest(apiKey: apiKey))
            .publishDecodable(type: Response.self)
            .value()
            .mapError { error in
                error
            }
            .eraseToAnyPublisher()
    }
}

// MARK: endpoints
public extension OmdbAPIClient {
    func getMovieItem(filter: MovieItemFilter) -> AnyPublisher<MovieItemDetailedInfo, Error> {
        doRequest(Router.getMovieItem(filter: filter))
    }
    
    func getMovieCollection(
        filter: MovieCollectionFilter
    ) -> AnyPublisher<MovieCollection, Error> {
        doRequest(Router.getMovieCollection(filter: filter))
    }
}
