import MovieServiceInterface
import OmdbSDK
import Combine

final class MovieManager { //}: MovieManagerInterface {
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
        
        let z = client
            .getMovieCollection(filter: filter)
            .map { data in
                data.items
            }
            
        
        
  
        
        
    }
    
//    func getItem(
//        id: String
//    ) -> AnyPublisher<MovieServiceInterface.MovieItemDetailedInfo, Error> {
//        Just(
//    }
}
