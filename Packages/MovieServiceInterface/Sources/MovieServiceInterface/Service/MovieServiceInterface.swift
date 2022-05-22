import Combine

public protocol MovieManagerInterface {
    func getDefaultItems() -> [MovieItemMetadata]
    func getItems(searchText: String, page: Int) -> AnyPublisher<[MovieItemMetadata], Error>
    func getItem(id: String) -> AnyPublisher<MovieItemDetailedInfo, Error>
}
