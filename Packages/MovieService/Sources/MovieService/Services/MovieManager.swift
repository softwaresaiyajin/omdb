import MovieServiceInterface
import OmdbSDK
import Combine

final class MovieManager: MovieManagerInterface {
    private let client: OmdbAPIClient
    
    init(client: OmdbAPIClient) {
        self.client = client
    }

    func getItems(
        searchText: String
    ) -> AnyPublisher<[MovieServiceInterface.MovieItemMetadata], Error> {
        let filter = MovieCollectionFilter(
            text: searchText,
            yearOfRelease: searchText
        )
        return client
            .getMovieCollection(filter: filter)
            .map(Factory.makeMovieItemsMetadata)
            .eraseToAnyPublisher()
    }
    
    func getItem(
        id: String
    ) -> AnyPublisher<MovieServiceInterface.MovieItemDetailedInfo, Error> {
        let filter = MovieItemFilter(id: id)
        return client
            .getMovieItem(filter: filter)
            .map(Factory.makeMovieItemDetailedInfo)
            .eraseToAnyPublisher()
    }
    
    func getDefaultItems() -> [MovieServiceInterface.MovieItemMetadata] {
        Factory.makeDefaultMovieItemsMetadata()
    }
}
