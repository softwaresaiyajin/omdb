import Combine

public protocol MovieManagerInterface {
    func getItems(searchText: String) -> AnyPublisher<[MovieItemMetadata], Error>
    func getItem(id: String) -> AnyPublisher<MovieItemDetailedInfo, Error>
}
