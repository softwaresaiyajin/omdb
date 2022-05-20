import XCTest
import Combine
@testable import OmdbSDK

final class OmdbSDKTests: XCTestCase {
    private lazy var client: OmdbAPIClient = {
        let apiKey = "c4a8a02e"
        return .init(apiKey: apiKey)
    }()

    func testGetMovieItem() throws {
        let filter = MovieItemFilter(title: "beautiful")
        let result = try awaitPublisher(
            client.getMovieItem(filter: filter),
            expectation: "Item must be found"
        )
        XCTAssertEqual(result.response, true)
    }
    
    func testGetMovieCollection() throws {
        let filter = MovieCollectionFilter(text: "beast")
        let result = try awaitPublisher(
            client.getMovieCollection(filter: filter),
            expectation: "Collection must be found"
        )
        XCTAssertEqual(result.response, true)
    }
    
    /**
     func getMovieItem(filter: MovieItemFilter) -> DataResponsePublisher<MovieItem> {
         doRequest(Router.getMovieItem(filter: filter))
     }
     
     func getMovieCollection(
         filter: MovieCollectionFilter
     ) -> DataResponsePublisher<MovieCollection> {
         doRequest(Router.getMovieCollection(filter: filter))
     }
     */
}
