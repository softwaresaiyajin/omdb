import Combine
import Foundation
import MovieServiceInterface
import AppCore

public protocol MovieListViewModelInterface: ObservableObject {
    var searchText: String { get set }
    var items: [MovieServiceInterface.MovieItemMetadata] { get }
    func load()
}

final class MovieListViewModel: MovieListViewModelInterface {
    @Published var searchText = ""
    @Published private(set) var items: [MovieServiceInterface.MovieItemMetadata] = []
    
    private let movieManager: MovieManagerInterface
    private var subscriptions: Set<AnyCancellable> = []
    
    init(movieManager: MovieManagerInterface) {
        self.movieManager = movieManager
    }
    
    func load() {
        $searchText
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink(receiveValue: getItems)
            .store(in: &subscriptions)
    }
    
    private func getItems(query: String) {
        movieManager
            .getItems(searchText: query)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                      self.items = []
                    case .finished:
                      break
                    }
                },
                receiveValue: { [weak self] items in
                    self?.items = items
                }
            )
            .store(in: &subscriptions)
    }
}

extension MovieListViewModel {
    convenience init() {
        self.init(movieManager: DI.resolve(MovieManagerInterface.self))
    }
}
