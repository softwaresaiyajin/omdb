import Combine
import Foundation
import MovieServiceInterface
import AppCore

protocol MovieListViewModelInterface: ObservableObject {
    var searchText: String { get set }
    var hasNextPage: Bool { get }
    var items: [MovieServiceInterface.MovieItemMetadata] { get }
    func load()
    func loadNextPage()
}

final class MovieListViewModel: MovieListViewModelInterface {
    @Published var searchText = ""
    @Published private(set) var hasNextPage = true
    @Published private(set) var items: [MovieServiceInterface.MovieItemMetadata] = []
    
    private let movieManager: MovieManagerInterface
    private let defaultItems: [MovieServiceInterface.MovieItemMetadata]
    private var subscriptions: Set<AnyCancellable> = []
    private var currentPage = 0
    
    init(movieManager: MovieManagerInterface) {
        self.movieManager = movieManager
        defaultItems = movieManager.getDefaultItems()
    }
    
    func load() {
        guard subscriptions.isEmpty else {
            return
        }
        
        showDefaultItems()

        $searchText
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.reset()
                self?.getItems(query: query)
            }
            .store(in: &subscriptions)
    }
    
    func loadNextPage() {
        getItems(query: searchText)
    }
    
    private func showDefaultItems() {
        currentPage = 0
        hasNextPage = false
        items = defaultItems
    }
    
    private func reset() {
        items = []
        currentPage = 0
        hasNextPage = true
    }
    
    private func getItems(query: String) {
        guard !query.isEmpty else {
            return showDefaultItems()
        }

        let nextPage = currentPage + 1
        
        movieManager
            .getItems(searchText: query, page: nextPage)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    switch value {
                    case .failure(let error):
                        debugPrint("fetch error: \(error.localizedDescription)")
                        self?.hasNextPage = false
                    case .finished:
                      break
                    }
                },
                receiveValue: { [weak self] items in
                    self?.items.append(contentsOf: items)
                    self?.currentPage = nextPage
                    self?.hasNextPage = !items.isEmpty
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
